# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/javier/remote_monitoring

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/javier/remote_monitoring/cmake

# Include any dependencies generated for this target.
include CMakeFiles/sample_app.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sample_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sample_app.dir/flags.make

CMakeFiles/sample_app.dir/parson/parson.c.o: CMakeFiles/sample_app.dir/flags.make
CMakeFiles/sample_app.dir/parson/parson.c.o: ../parson/parson.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/javier/remote_monitoring/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sample_app.dir/parson/parson.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sample_app.dir/parson/parson.c.o   -c /home/javier/remote_monitoring/parson/parson.c

CMakeFiles/sample_app.dir/parson/parson.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sample_app.dir/parson/parson.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/javier/remote_monitoring/parson/parson.c > CMakeFiles/sample_app.dir/parson/parson.c.i

CMakeFiles/sample_app.dir/parson/parson.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sample_app.dir/parson/parson.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/javier/remote_monitoring/parson/parson.c -o CMakeFiles/sample_app.dir/parson/parson.c.s

CMakeFiles/sample_app.dir/parson/parson.c.o.requires:

.PHONY : CMakeFiles/sample_app.dir/parson/parson.c.o.requires

CMakeFiles/sample_app.dir/parson/parson.c.o.provides: CMakeFiles/sample_app.dir/parson/parson.c.o.requires
	$(MAKE) -f CMakeFiles/sample_app.dir/build.make CMakeFiles/sample_app.dir/parson/parson.c.o.provides.build
.PHONY : CMakeFiles/sample_app.dir/parson/parson.c.o.provides

CMakeFiles/sample_app.dir/parson/parson.c.o.provides.build: CMakeFiles/sample_app.dir/parson/parson.c.o


CMakeFiles/sample_app.dir/remote_monitoring.c.o: CMakeFiles/sample_app.dir/flags.make
CMakeFiles/sample_app.dir/remote_monitoring.c.o: ../remote_monitoring.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/javier/remote_monitoring/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/sample_app.dir/remote_monitoring.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sample_app.dir/remote_monitoring.c.o   -c /home/javier/remote_monitoring/remote_monitoring.c

CMakeFiles/sample_app.dir/remote_monitoring.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sample_app.dir/remote_monitoring.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/javier/remote_monitoring/remote_monitoring.c > CMakeFiles/sample_app.dir/remote_monitoring.c.i

CMakeFiles/sample_app.dir/remote_monitoring.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sample_app.dir/remote_monitoring.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/javier/remote_monitoring/remote_monitoring.c -o CMakeFiles/sample_app.dir/remote_monitoring.c.s

CMakeFiles/sample_app.dir/remote_monitoring.c.o.requires:

.PHONY : CMakeFiles/sample_app.dir/remote_monitoring.c.o.requires

CMakeFiles/sample_app.dir/remote_monitoring.c.o.provides: CMakeFiles/sample_app.dir/remote_monitoring.c.o.requires
	$(MAKE) -f CMakeFiles/sample_app.dir/build.make CMakeFiles/sample_app.dir/remote_monitoring.c.o.provides.build
.PHONY : CMakeFiles/sample_app.dir/remote_monitoring.c.o.provides

CMakeFiles/sample_app.dir/remote_monitoring.c.o.provides.build: CMakeFiles/sample_app.dir/remote_monitoring.c.o


CMakeFiles/sample_app.dir/main.c.o: CMakeFiles/sample_app.dir/flags.make
CMakeFiles/sample_app.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/javier/remote_monitoring/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/sample_app.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sample_app.dir/main.c.o   -c /home/javier/remote_monitoring/main.c

CMakeFiles/sample_app.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sample_app.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/javier/remote_monitoring/main.c > CMakeFiles/sample_app.dir/main.c.i

CMakeFiles/sample_app.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sample_app.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/javier/remote_monitoring/main.c -o CMakeFiles/sample_app.dir/main.c.s

CMakeFiles/sample_app.dir/main.c.o.requires:

.PHONY : CMakeFiles/sample_app.dir/main.c.o.requires

CMakeFiles/sample_app.dir/main.c.o.provides: CMakeFiles/sample_app.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/sample_app.dir/build.make CMakeFiles/sample_app.dir/main.c.o.provides.build
.PHONY : CMakeFiles/sample_app.dir/main.c.o.provides

CMakeFiles/sample_app.dir/main.c.o.provides.build: CMakeFiles/sample_app.dir/main.c.o


# Object files for target sample_app
sample_app_OBJECTS = \
"CMakeFiles/sample_app.dir/parson/parson.c.o" \
"CMakeFiles/sample_app.dir/remote_monitoring.c.o" \
"CMakeFiles/sample_app.dir/main.c.o"

# External object files for target sample_app
sample_app_EXTERNAL_OBJECTS =

sample_app: CMakeFiles/sample_app.dir/parson/parson.c.o
sample_app: CMakeFiles/sample_app.dir/remote_monitoring.c.o
sample_app: CMakeFiles/sample_app.dir/main.c.o
sample_app: CMakeFiles/sample_app.dir/build.make
sample_app: CMakeFiles/sample_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/javier/remote_monitoring/cmake/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable sample_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sample_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sample_app.dir/build: sample_app

.PHONY : CMakeFiles/sample_app.dir/build

CMakeFiles/sample_app.dir/requires: CMakeFiles/sample_app.dir/parson/parson.c.o.requires
CMakeFiles/sample_app.dir/requires: CMakeFiles/sample_app.dir/remote_monitoring.c.o.requires
CMakeFiles/sample_app.dir/requires: CMakeFiles/sample_app.dir/main.c.o.requires

.PHONY : CMakeFiles/sample_app.dir/requires

CMakeFiles/sample_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sample_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sample_app.dir/clean

CMakeFiles/sample_app.dir/depend:
	cd /home/javier/remote_monitoring/cmake && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/javier/remote_monitoring /home/javier/remote_monitoring /home/javier/remote_monitoring/cmake /home/javier/remote_monitoring/cmake /home/javier/remote_monitoring/cmake/CMakeFiles/sample_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sample_app.dir/depend
