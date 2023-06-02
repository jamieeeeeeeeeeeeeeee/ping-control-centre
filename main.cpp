#include <glad/gl.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#include <stdlib.h>
#include <stdio.h>
#include <chrono>
#include <thread>
#include <vector>
#include <string>
#include <sqlite3.h>

#include <imgui.h>
#include <backends/imgui_impl_glfw.h>
#include <backends/imgui_impl_opengl3.h>

#define CATCH_SQLITE(rc, db, successMessage) \
  if ((rc) != SQLITE_OK) { \
      fprintf(stderr, "SQL error: %s\n", sqlite3_errmsg((db))); \
  } else { \
      fprintf(stdout, (successMessage)); \
  }

#define CATCH_MALLOC(ptr, successMessage) \
  if ((ptr) == NULL) { \
      fprintf(stderr, "Malloc failed.\n"); \
      exit(EXIT_FAILURE); \
  } else { \
      fprintf(stdout, (successMessage)); \
  }

void error_callback(int error, const char* description) {
  fprintf(stderr, "Error: %s\n", description);
}

void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods) {
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
  glViewport(0, 0, width, height);
}

typedef struct machine {
  char* name;
  char* lastPing;
  int pingCount;
  int lastStatus;
} machine;

const char* sqlCreateTableMachine = \
  "CREATE TABLE IF NOT EXISTS machines (" \
    "name TEXT PRIMARY KEY NOT NULL," \
    "lastPing TEXT DEFAULT 0," \
    "pingCount INT DEFAULT 0," \
    "lastStatus INT DEFAULT 2" \
  ");";
const char* sqlCountAllMachines = "SELECT COUNT(*) FROM machines;";
const char* sqlSelectAllMachines = "SELECT * FROM machines;";
const char* sqlInsertMachine = "INSERT INTO machines (name) VALUES (?);";

machine *machines;
int numMachines = 0;

static int countMachinesCallback(void *data, int argc, char **argv, char **azColName) {
  numMachines = atoi(argv[0]);
  printf("numMachines: %d\n", numMachines);
  return 0;
}

static int selectMachinesCallback(void *data, int argc, char **argv, char **azColName) {
  machines[numMachines].name = strdup(argv[0]);
  machines[numMachines].lastPing = strdup(argv[1]);
  machines[numMachines].pingCount = atoi(argv[2]);
  machines[numMachines].lastStatus = atoi(argv[3]);
  numMachines++;
  return 0;
}

void hybridSearch(char* searchValue, int* foundStart, int* foundEnd) {
  int start = 0;
  int end = numMachines - 1;
  int foundAt = -1;
  int searchLength = strlen(searchValue);
  char* middleValue = (char*)malloc(sizeof(char) * (searchLength + 1));

  printf("searchValue: %s, searchLength: %d\n", searchValue, searchLength);

  CATCH_MALLOC(middleValue, "Allocated.\n")
  middleValue[searchLength] = '\0';

  while (end >= start && foundAt == -1) {
    int middle = (start + end) >> 1;
    // set the middle value to machines[middle].name[0:searchLength]
    strncpy(middleValue, machines[middle].name, searchLength);
    if (strcmp(searchValue, middleValue) == 0) {
      foundAt = middle;
    } else if (strcmp(searchValue, middleValue) < 0) {
      end = middle - 1;
    } else {
      start = middle + 1;
    }
  }

  free(middleValue);
  *foundStart = foundAt - 1;
  *foundEnd = foundAt + 1;

  if (foundAt != -1) {
    while (*foundStart >= 0 && strncmp(searchValue, machines[*foundStart].name, searchLength) == 0) {
      (*foundStart)--; // without the brackets this decrements the point itself!
    }
    (*foundStart)++; // increment back to the last valid value
    while (*foundEnd < numMachines && strncmp(searchValue, machines[*foundEnd].name, searchLength) == 0) {
      (*foundEnd)++;
    }
    // no need to decrement since loop is < than.
  } else {
    *foundStart = 0;
    *foundEnd = 0;
  }

  free(searchValue);
}

int main(void) {
  /* GLFW SETUP */
  glfwSetErrorCallback(error_callback);

  if (!glfwInit()) {
      exit(EXIT_FAILURE);
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

  GLFWwindow* window = glfwCreateWindow(640, 480, "Papa Command Centre", NULL, NULL);
  if (!window) {
      glfwTerminate();
      exit(EXIT_FAILURE);
  }

  glfwSetKeyCallback(window, key_callback);
  glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

  glfwMakeContextCurrent(window);
  gladLoadGL(glfwGetProcAddress);
  glfwSwapInterval(1);

  if (glGetError() != GL_NO_ERROR) {
      fprintf(stderr, "Error: %s\n", "OpenGL error");
      exit(EXIT_FAILURE);
  }

  /* IMGUI SETUP */
  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGui_ImplGlfw_InitForOpenGL(window, true);
  ImGui_ImplOpenGL3_Init("#version 330");

  char inputBuffer[256] = {0};
  bool showNavigationBar = true;  // Variable to control visibility of the navigation bar
  int selectedItem = -1;  // Variable to track the selected item
  
  // SQLITE SETUP */
  sqlite3 *db;
  int rc = sqlite3_open("papa.db", &db);
  CATCH_SQLITE(rc, db, "Opened database successfully.\n")

  rc = sqlite3_exec(db, sqlCreateTableMachine, NULL, NULL, NULL);
  CATCH_SQLITE(rc, db, "Created table machines.\n")

  rc = sqlite3_exec(db, sqlCountAllMachines, countMachinesCallback, NULL, NULL);
  CATCH_SQLITE(rc, db, "Counted all machines.\n")

  // Allocate memory for machines array
  machines = (machine*)malloc(sizeof(machine) * numMachines);
  CATCH_MALLOC(machines, "Allocated memory for machines array.\n")
  
  // Get all machines from the database
  numMachines = 0;
  rc = sqlite3_exec(db, sqlSelectAllMachines, selectMachinesCallback, NULL, NULL);
  CATCH_SQLITE(rc, db, "Selected all machines.\n")

  static char nameBuffer[256] = ""; // Buffer to store the entered name
  static char lastSearchValue[256] = ""; // Buffer to store the last search value
  bool needsRedraw = false;

  int *machineStartPointer = (int*)malloc(sizeof(int));
  int *machineEndPointer = (int*)malloc(sizeof(int));

  /* MAIN RENDER LOOP */
  while (!glfwWindowShouldClose(window)) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();

    // Create ImGui frame
    ImGui::NewFrame(); 

    ImGui::SetNextWindowPos(ImVec2(0, 0));  // Set position at the top left corner
    ImGui::SetNextWindowSize(ImGui::GetIO().DisplaySize);  // Stretch it across the full screen

    // Create the Pinger
    ImGui::Begin("Pinger", &showNavigationBar, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoCollapse);

    if (ImGui::Button("CLEAR")) {
      memset(inputBuffer, 0, sizeof(inputBuffer));  // Clear the input buffer
    }
    ImGui::SameLine();
    ImGui::InputText("##input", inputBuffer, sizeof(inputBuffer));

    // if inputBuffer != lastSearchValue: 
    if (strcmp(inputBuffer, "") == 0) {
      *machineStartPointer = 0;
      *machineEndPointer = numMachines;
    } else if (strcmp(inputBuffer, lastSearchValue) != 0) {
      strcpy(lastSearchValue, inputBuffer);

      // convert inputBuffer to char*
      char *searchValue = (char*)malloc(sizeof(char) * strlen(inputBuffer));
      strcpy(searchValue, inputBuffer);
      hybridSearch(searchValue, machineStartPointer, machineEndPointer);
    }

    ImGui::SameLine();
    if (ImGui::Button("PING")) {
      if (selectedItem >= 0 && selectedItem < numMachines) {
        const machine& selectedMachine = machines[selectedItem];
        std::string hostname = selectedMachine.name;

        std::string pingCommand;
        #ifdef _WIN32
            // Windows
            pingCommand = "ping " + hostname;
        #else
            // Linux
            pingCommand = "ping " + hostname;
        #endif

        // Execute the ping command
        std::system(pingCommand.c_str());
      }
    }

      ImGui::SameLine();
  if (ImGui::Button("ADD")) {
    needsRedraw = true;
    ImGui::OpenPopup("Enter Name");
    memset(nameBuffer, 0, sizeof(nameBuffer));  // Clear the name buffer
  }

  // Create the Enter Name popup
  if (ImGui::BeginPopupModal("Enter Name", NULL, ImGuiWindowFlags_AlwaysAutoResize)) {
    ImGui::InputText("##name", nameBuffer, sizeof(nameBuffer));
    ImGui::SameLine();
    if (ImGui::Button("OK")) {
      std::string name = nameBuffer;

      std::string insertCommand = "INSERT INTO machines (name) VALUES ('" + name + "');";
      rc = sqlite3_exec(db, insertCommand.c_str(), NULL, NULL, NULL);
      CATCH_SQLITE(rc, db, "Inserted machine.\n")

      // Get all machines from the database
      rc = sqlite3_exec(db, sqlCountAllMachines, countMachinesCallback, NULL, NULL);
      CATCH_SQLITE(rc, db, "Counted all machines.\n")

      // Allocate memory for machines array
      machines = (machine*)malloc(sizeof(machine) * numMachines);
      CATCH_MALLOC(machines, "Allocated memory for machines array.\n")
      
      // Get all machines from the database
      numMachines = 0;
      rc = sqlite3_exec(db, sqlSelectAllMachines, selectMachinesCallback, NULL, NULL);
      CATCH_SQLITE(rc, db, "Selected all machines.\n")

      ImGui::CloseCurrentPopup();
    }
    ImGui::SameLine();
    if (ImGui::Button("Cancel")) {
      ImGui::CloseCurrentPopup();
    }
    ImGui::EndPopup();
  }

  ImGui::SameLine();
  if (ImGui::Button("DEL")) {
    if (selectedItem >= 0 && selectedItem < numMachines) {
      const machine& selectedMachine = machines[selectedItem];
      std::string name = selectedMachine.name;

      std::string deleteCommand = "DELETE FROM machines WHERE name = '" + name + "';";
      rc = sqlite3_exec(db, deleteCommand.c_str(), NULL, NULL, NULL);
      CATCH_SQLITE(rc, db, "Deleted machine.\n")

      // Get all machines from the database
      numMachines = 0;
      rc = sqlite3_exec(db, sqlSelectAllMachines, selectMachinesCallback, NULL, NULL);
      CATCH_SQLITE(rc, db, "Selected all machines.\n")
    }
  }

    // ADD LISTBOX WHICH CONTAINS MACHINES HERE
    if (ImGui::BeginListBox("##machines", ImVec2(-1, -1))) {
      if (*machineStartPointer < 0) {
        *machineStartPointer = 0;
      }
      if (*machineEndPointer > numMachines) {
        *machineEndPointer = numMachines;
      }
      for (int i = *machineStartPointer; i < *machineEndPointer; i++) {
        const bool isSelected = (selectedItem == i);
        // print machines name
        if (ImGui::Selectable(machines[i].name, isSelected)) {
            selectedItem = i;
        }
      }
      ImGui::EndListBox();
    }
    
      ImGui::End();  // End of the pinger frame
      
      ImGui::Render();
      ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

      glfwSwapBuffers(window);
      if (!needsRedraw) {
          glfwWaitEvents();
      }
      needsRedraw = false;
  }

  /* CLEANUP */
  ImGui_ImplOpenGL3_Shutdown();
  ImGui_ImplGlfw_Shutdown();
  ImGui::DestroyContext();
  sqlite3_close(db);

  glfwDestroyWindow(window);
  glfwTerminate();
  free(machines);
  exit(EXIT_SUCCESS);
}