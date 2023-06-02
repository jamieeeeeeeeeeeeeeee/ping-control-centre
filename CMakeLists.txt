cmake_minimum_required(VERSION 3.5)

# Set project name and version
project(thingforpapa VERSION 1.0)

# Find GLFW library
find_package(glfw3 REQUIRED)

# Add GLFW, glad, imgui include directory to your include paths
include_directories( ${GLFW_INCLUDE_DIRS} glfw/include glad/include glfw/deps imgui sqlite)

# BUILD imgui, sqlite, and glfw3 from source
file(GLOB imgui_src imgui/*.cpp imgui/backends/imgui_impl_glfw.cpp imgui/backends/imgui_impl_opengl3.cpp)
add_library(imgui STATIC
    ${imgui_src}
)

file(GLOB glfw3_src glfw/src/*.c)
add_library(glfw3 STATIC
    ${glfw3_src}
)

# Add your source files to the project
add_executable(papa main.cpp glad/src/gl.c)

set(SQLITE_LIBRARY_DIR sqlite)

# Link the GLFW library to your project
target_link_libraries(papa PRIVATE GL m glfw imgui sqlite)

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_C_COMPILER /usr/bin/x86_64-w64-mingw32-c++-win32)
set(CMAKE_CXX_COMPILER /usr/bin/x86_64-w64-mingw32-g++-win32)