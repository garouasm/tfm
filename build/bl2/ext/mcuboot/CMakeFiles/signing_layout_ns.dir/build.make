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
CMAKE_SOURCE_DIR = /home/sam/Desktop/trusted-firmware-m

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sam/Desktop/trusted-firmware-m/build

# Include any dependencies generated for this target.
include bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/compiler_depend.make

# Include the progress variables for this target.
include bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/progress.make

# Include the compile flags for this target's objects.
include bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/flags.make

bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o: bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/flags.make
bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o: bl2/ext/mcuboot/signing_layout_ns.c
bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o: bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o -MF CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o.d -o CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o -c /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/signing_layout_ns.c

bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/signing_layout_ns.dir/signing_layout_ns.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/signing_layout_ns.c > CMakeFiles/signing_layout_ns.dir/signing_layout_ns.i

bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/signing_layout_ns.dir/signing_layout_ns.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/signing_layout_ns.c -o CMakeFiles/signing_layout_ns.dir/signing_layout_ns.s

signing_layout_ns: bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o
signing_layout_ns: bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/build.make
.PHONY : signing_layout_ns

# Rule to build all files generated by this target.
bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/build: signing_layout_ns
.PHONY : bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/build

bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/clean:
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot && $(CMAKE_COMMAND) -P CMakeFiles/signing_layout_ns.dir/cmake_clean.cmake
.PHONY : bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/clean

bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/depend:
	cd /home/sam/Desktop/trusted-firmware-m/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sam/Desktop/trusted-firmware-m /home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot /home/sam/Desktop/trusted-firmware-m/build /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/depend
