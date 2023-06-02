#include <glad/gl.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#include "linmath.h"

#include <stdlib.h>
#include <stdio.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

typedef struct {
  float position[2];
  float color[3];
} Vertex;

Vertex* vertices = NULL;
GLuint* indices = NULL;
size_t verticesCount = 0;
size_t indicesCount = 0;
lua_State* L = NULL;

GLFWwindow* window;
GLuint vertex_buffer, vertex_shader, fragment_shader, program;
GLint mvp_location, vpos_location, vcol_location;


int lua_panicHandler(lua_State* L) {
  const char* panicMessage = lua_tostring(L, -1);
  fprintf(stderr, "LP: %s\n", panicMessage);
  return 0;
}
static void error_callback(int error, const char* description) {
  fprintf(stderr, "Error: %s\n", description);
}
static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods) {
  if (L == NULL) {
    return;
  }
  lua_getglobal(L, "handleKeyEvent");  // Get the Lua function from the global environment
  lua_pushinteger(L, key);             // Push the key as an argument
  lua_pushinteger(L, scancode);        // Push the scancode as an argument
  lua_pushinteger(L, action);          // Push the action as an argument
  lua_pushinteger(L, mods);            // Push the mods as an argument
  lua_call(L, 4, 0);                   // Call the Lua function with 4 arguments
}
void drawRectangle(float x, float y, float width, float height, float r, float g, float b) {
  Vertex v1 = {{x, y}, {r, g, b}};
  Vertex v2 = {{x + width, y}, {r, g, b}};
  Vertex v3 = {{x + width, y + height}, {r, g, b}};
  Vertex v4 = {{x, y + height}, {r, g, b}};

  // Reallocate memory for vertices
  verticesCount += 4;
  vertices = realloc(vertices, verticesCount * sizeof(Vertex));
  vertices[verticesCount - 4] = v1;
  vertices[verticesCount - 3] = v2;
  vertices[verticesCount - 2] = v3;
  vertices[verticesCount - 1] = v4;

  // Reallocate memory for indices
  indicesCount += 6;
  indices = realloc(indices, indicesCount * sizeof(GLuint));
  GLuint startIndex = verticesCount - 4;
  indices[indicesCount - 6] = startIndex;
  indices[indicesCount - 5] = startIndex + 1;
  indices[indicesCount - 4] = startIndex + 2;
  indices[indicesCount - 3] = startIndex + 2;
  indices[indicesCount - 2] = startIndex + 3;
  indices[indicesCount - 1] = startIndex;
}
int lua_drawRectangle(lua_State* L) {

  // Retrieve the number of arguments passed to the C function
  int numArgs = lua_gettop(L);

  // Ensure the correct number of arguments are provided
  if (numArgs != 7) {
      return luaL_error(L, "drawRectangle expects 7 arguments");
  }

  // Retrieve the arguments from the Lua stack
  float x = lua_tonumber(L, 1);  // Retrieve the first argument as a float
  float y = lua_tonumber(L, 2);  // Retrieve the second argument as a float
  float width = lua_tonumber(L, 3);  // Retrieve the third argument as a float
  float height = lua_tonumber(L, 4);  // Retrieve the fourth argument as a float
  float r = lua_tonumber(L, 5);  // Retrieve the fifth argument as a float
  float g = lua_tonumber(L, 6);  // Retrieve the sixth argument as a float
  float b = lua_tonumber(L, 7);  // Retrieve the seventh argument as a float

  // Call the C function
  drawRectangle(x, y, width, height, r, g, b);
  return 0;
}
void drawDisplay(GLFWwindow* window, GLuint mvp_location) {
  int width, height;
  mat4x4 mvp, projection, model, view;

  glfwGetFramebufferSize(window, &width, &height);
  glViewport(0, 0, width, height);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  // Create the model-view-projection (MVP) matrix
  mat4x4_identity(model);
  mat4x4_rotate_Z(model, model, (float)glfwGetTime());
  mat4x4_ortho(projection, -1.f, 1.f, -1.f, 1.f, 1.f, -1.f);
  mat4x4_look_at(view, (vec3){0.f, 0.f, 1.f}, (vec3){0.f, 0.f, 0.f}, (vec3){0.f, 1.f, 0.f});
  mat4x4_mul(mvp, projection, model);

  // Set the MVP matrix uniform
  glUniformMatrix4fv(mvp_location, 1, GL_FALSE, (const GLfloat*)mvp);

  // Draw all rectangles
  for (size_t i = 0; i < indicesCount; i += 6) {
    glBufferData(GL_ARRAY_BUFFER, verticesCount * sizeof(Vertex), vertices, GL_STATIC_DRAW);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, indices + i);
  }
  glfwSwapBuffers(window);
}
int lua_drawDisplay(lua_State* L) {
  drawDisplay(window, mvp_location);
}
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
  glViewport(0, 0, width, height);
  drawDisplay(window, mvp_location);
}

void* lua_scriptThread(void* arg) {
  lua_State* L = luaL_newState();
  luaL_openlibs(L);

  const char* scriptName = (const char*) arg;
  int result = luaL_dofile(L, scriptName);
  if (result != LUA_OK) {
    fprintf(stderr, "LE: %s\n", lua_tostring(L, -1));
    exit(EXIT_FAILURE);
  }  

  lua_close(L);
  return NULL;
}

int main(void) {
  glfwSetErrorCallback(error_callback);

  if (!glfwInit()) {
    exit(EXIT_FAILURE);
  }

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

  window = glfwCreateWindow(640, 480, "Papa's Links", NULL, NULL);
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

  // Create and bind the vertex buffer object (VBO)
  glGenBuffers(1, &vertex_buffer); // generates a unique buffer ID
  glBindBuffer(GL_ARRAY_BUFFER, vertex_buffer); // binds the newly created buffer to the GL_ARRAY_BUFFER target 
  // any other buffer operations on the GL_ARRAY_BUFFER target will affect this buffer
  // Vertex buffer objects are used to store vertex data in GPU memory

  // Create and compile the vertex shader
  vertex_shader = glCreateShader(GL_VERTEX_SHADER); // this creates the vertex shader object
  // Vertex shaders are the GPU programs that process vertex data
  const char* vertex_shader_source = "#version 110\n"
                                      "uniform mat4 MVP;\n"
                                      "attribute vec2 vPos;\n"
                                      "attribute vec3 vCol;\n"
                                      "varying vec3 color;\n"
                                      "void main() {\n"
                                      "  gl_Position = MVP * vec4(vPos, 0.0, 1.0);\n"
                                      "  color = vCol;\n"
                                      "}\n";
  // above is the GLSL shader code. 
  // Shaders run on the GPU!
  glShaderSource(vertex_shader, 1, &vertex_shader_source, NULL);
  glCompileShader(vertex_shader);

  // Create and compile the fragment shader
  fragment_shader = glCreateShader(GL_FRAGMENT_SHADER); // this creates the fragment shader object
  // Fragment shaders are the GPU programs that process the COLOUR of each pixel
  const char* fragment_shader_source = "#version 110\n"
                                        "varying vec3 color;\n"
                                        "void main() {\n"
                                        "  gl_FragColor = vec4(color, 1.0);\n"
                                        "}\n";
  glShaderSource(fragment_shader, 1, &fragment_shader_source, NULL);
  glCompileShader(fragment_shader);

  // Create and link the shader program
  program = glCreateProgram();
  glAttachShader(program, vertex_shader);
  glAttachShader(program, fragment_shader);
  glLinkProgram(program);
  glUseProgram(program);

  // Retrieve the uniform and attribute locations
  mvp_location = glGetUniformLocation(program, "MVP");
  vpos_location = glGetAttribLocation(program, "vPos");
  vcol_location = glGetAttribLocation(program, "vCol");

  // Create and bind the vertex array object (VAO)
  GLuint vao;
  glGenVertexArrays(1, &vao);
  glBindVertexArray(vao);

  // Specify the vertex attribute pointers
  glEnableVertexAttribArray(vpos_location);
  glVertexAttribPointer(vpos_location, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)0);
  glEnableVertexAttribArray(vcol_location);
  glVertexAttribPointer(vcol_location, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)(sizeof(float) * 2));

  // Enable depth testing
  glEnable(GL_DEPTH_TEST);

  // Lua Setup //
  L = luaL_newstate();
  luaL_openlibs(L);

  lua_atpanic(L, lua_panicHandler);

  lua_pushcfunction(L, lua_drawRectangle);
  lua_setglobal(L, "drawRectangle");

  lua_pushcfunction(L, lua_drawDisplay);
  lua_setglobal(L, "drawDisplay");

  int result = luaL_dofile(L, "script.lua");
  if (result != LUA_OK) {
    fprintf(stderr, "LE: %s\n", lua_tostring(L, -1));
    exit(EXIT_FAILURE);
  }

  while (!glfwWindowShouldClose(window)) {
    glfwWaitEvents();
  }

  // Clean up
  lua_close(L);
  glDeleteProgram(program);
  glDeleteShader(fragment_shader);
  glDeleteShader(vertex_shader);
  glDeleteBuffers(1, &vertex_buffer);
  glDeleteVertexArrays(1, &vao);

  free(vertices);
  free(indices);

  glfwDestroyWindow(window);
  glfwTerminate();
  exit(EXIT_SUCCESS);
}