# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jamie/Documents/source/thingforpapa

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jamie/Documents/source/thingforpapa/build

# Include any dependencies generated for this target.
include CMakeFiles/imgui.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/imgui.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/imgui.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/imgui.dir/flags.make

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o: ../imgui/backends/imgui_impl_glfw.cpp
CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o -MF CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o.d -o CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_glfw.cpp

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_glfw.cpp > CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.i

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_glfw.cpp -o CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.s

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o: ../imgui/backends/imgui_impl_opengl3.cpp
CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o -MF CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o.d -o CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_opengl3.cpp

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_opengl3.cpp > CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.i

CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/backends/imgui_impl_opengl3.cpp -o CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.s

CMakeFiles/imgui.dir/imgui/imgui.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/imgui.cpp.o: ../imgui/imgui.cpp
CMakeFiles/imgui.dir/imgui/imgui.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/imgui.dir/imgui/imgui.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/imgui.cpp.o -MF CMakeFiles/imgui.dir/imgui/imgui.cpp.o.d -o CMakeFiles/imgui.dir/imgui/imgui.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/imgui.cpp

CMakeFiles/imgui.dir/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/imgui.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/imgui.cpp > CMakeFiles/imgui.dir/imgui/imgui.cpp.i

CMakeFiles/imgui.dir/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/imgui.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/imgui.cpp -o CMakeFiles/imgui.dir/imgui/imgui.cpp.s

CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o: ../imgui/imgui_demo.cpp
CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o -MF CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o.d -o CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/imgui_demo.cpp

CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/imgui_demo.cpp > CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.i

CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/imgui_demo.cpp -o CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.s

CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o: ../imgui/imgui_draw.cpp
CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o -MF CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o.d -o CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/imgui_draw.cpp

CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/imgui_draw.cpp > CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.i

CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/imgui_draw.cpp -o CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.s

CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o: ../imgui/imgui_tables.cpp
CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o -MF CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o.d -o CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/imgui_tables.cpp

CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/imgui_tables.cpp > CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.i

CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/imgui_tables.cpp -o CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.s

CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o: CMakeFiles/imgui.dir/flags.make
CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o: ../imgui/imgui_widgets.cpp
CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o: CMakeFiles/imgui.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o -MF CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o.d -o CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o -c /home/jamie/Documents/source/thingforpapa/imgui/imgui_widgets.cpp

CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.i"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jamie/Documents/source/thingforpapa/imgui/imgui_widgets.cpp > CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.i

CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.s"
	/usr/bin/x86_64-w64-mingw32-g++-win32 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jamie/Documents/source/thingforpapa/imgui/imgui_widgets.cpp -o CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.s

# Object files for target imgui
imgui_OBJECTS = \
"CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o" \
"CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/imgui.dir/imgui/imgui.cpp.o" \
"CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o" \
"CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o" \
"CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o" \
"CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o"

# External object files for target imgui
imgui_EXTERNAL_OBJECTS =

libimgui.a: CMakeFiles/imgui.dir/imgui/backends/imgui_impl_glfw.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/backends/imgui_impl_opengl3.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/imgui.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/imgui_demo.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/imgui_draw.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/imgui_tables.cpp.o
libimgui.a: CMakeFiles/imgui.dir/imgui/imgui_widgets.cpp.o
libimgui.a: CMakeFiles/imgui.dir/build.make
libimgui.a: CMakeFiles/imgui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jamie/Documents/source/thingforpapa/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library libimgui.a"
	$(CMAKE_COMMAND) -P CMakeFiles/imgui.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/imgui.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/imgui.dir/build: libimgui.a
.PHONY : CMakeFiles/imgui.dir/build

CMakeFiles/imgui.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/imgui.dir/cmake_clean.cmake
.PHONY : CMakeFiles/imgui.dir/clean

CMakeFiles/imgui.dir/depend:
	cd /home/jamie/Documents/source/thingforpapa/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jamie/Documents/source/thingforpapa /home/jamie/Documents/source/thingforpapa /home/jamie/Documents/source/thingforpapa/build /home/jamie/Documents/source/thingforpapa/build /home/jamie/Documents/source/thingforpapa/build/CMakeFiles/imgui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/imgui.dir/depend

