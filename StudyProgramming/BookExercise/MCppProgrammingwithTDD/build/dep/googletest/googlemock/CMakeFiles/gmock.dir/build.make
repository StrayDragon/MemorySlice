# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_SOURCE_DIR = /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build

# Include any dependencies generated for this target.
include dep/googletest/googlemock/CMakeFiles/gmock.dir/depend.make

# Include the progress variables for this target.
include dep/googletest/googlemock/CMakeFiles/gmock.dir/progress.make

# Include the compile flags for this target's objects.
include dep/googletest/googlemock/CMakeFiles/gmock.dir/flags.make

dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o: dep/googletest/googlemock/CMakeFiles/gmock.dir/flags.make
dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o: ../dep/googletest/googlemock/src/gmock-all.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o"
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && /usr/bin/clang++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gmock.dir/src/gmock-all.cc.o -c /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/dep/googletest/googlemock/src/gmock-all.cc

dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gmock.dir/src/gmock-all.cc.i"
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && /usr/bin/clang++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/dep/googletest/googlemock/src/gmock-all.cc > CMakeFiles/gmock.dir/src/gmock-all.cc.i

dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gmock.dir/src/gmock-all.cc.s"
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && /usr/bin/clang++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/dep/googletest/googlemock/src/gmock-all.cc -o CMakeFiles/gmock.dir/src/gmock-all.cc.s

# Object files for target gmock
gmock_OBJECTS = \
"CMakeFiles/gmock.dir/src/gmock-all.cc.o"

# External object files for target gmock
gmock_EXTERNAL_OBJECTS =

lib/libgmockd.a: dep/googletest/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
lib/libgmockd.a: dep/googletest/googlemock/CMakeFiles/gmock.dir/build.make
lib/libgmockd.a: dep/googletest/googlemock/CMakeFiles/gmock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../lib/libgmockd.a"
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean_target.cmake
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gmock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dep/googletest/googlemock/CMakeFiles/gmock.dir/build: lib/libgmockd.a

.PHONY : dep/googletest/googlemock/CMakeFiles/gmock.dir/build

dep/googletest/googlemock/CMakeFiles/gmock.dir/clean:
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean.cmake
.PHONY : dep/googletest/googlemock/CMakeFiles/gmock.dir/clean

dep/googletest/googlemock/CMakeFiles/gmock.dir/depend:
	cd /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/dep/googletest/googlemock /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock /home/straydragon/GitHubRepo/MemorySlice/StudyProgramming/BookExercise/MCppProgrammingwithTDD/build/dep/googletest/googlemock/CMakeFiles/gmock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dep/googletest/googlemock/CMakeFiles/gmock.dir/depend
