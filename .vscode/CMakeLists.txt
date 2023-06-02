cmake_minimum_required(VERSION 3.5)

# Set project name and version
project(thingforpapa VERSION 1.0)

# Find GLFW library
find_package(glfw3 REQUIRED)

# Build lualib
file(GLOB lua_src lua/src/*.c)
add_library(lua STATIC
    ${lua_src}
)

target_include_directories(lua PUBLIC lua)

# Add GLFW, glad, imgui include directory to your include paths
include_directories( ${GLFW_INCLUDE_DIRS} lua/src glad/include glfw/deps imgui)

# Add your source files to the project
add_executable(papa main.cpp glad/src/gl.c lua)

# Link the GLFW library to your project
target_link_libraries(papa PRIVATE GL m glfw lua)

# Platform specific compiler defs #
if (CMAKE_SYSTEM_NAME STREQUAL "Linux" OR CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    add_definitions(-DLUA_USE_POSIX=1)
endif()