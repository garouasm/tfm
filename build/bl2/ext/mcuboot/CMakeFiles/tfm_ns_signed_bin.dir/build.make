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

# Utility rule file for tfm_ns_signed_bin.

# Include any custom commands dependencies for this target.
include bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/compiler_depend.make

# Include the progress variables for this target.
include bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/progress.make

bl2/ext/mcuboot/tfm_ns_signed.bin: bin/tfm_ns.bin
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating tfm_ns_signed.bin"
	cd /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mcuboot-src/scripts && /usr/bin/python3.10 /home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot/scripts/wrapper/wrapper.py -v 0.0.0 --layout /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o -k /home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot/root-RSA-3072_1.pem --public-key-format full --align 1 --pad --pad-header -H 0x400 -s 1 -L 128 -d "(0, 0.0.0+0)" /home/sam/Desktop/trusted-firmware-m/build/bin/tfm_ns.bin --overwrite-only   --measured-boot-record /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/tfm_ns_signed.bin
	cd /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mcuboot-src/scripts && /usr/bin/cmake -E copy /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/tfm_ns_signed.bin /home/sam/Desktop/trusted-firmware-m/build/bin

tfm_ns_signed_bin: bl2/ext/mcuboot/tfm_ns_signed.bin
tfm_ns_signed_bin: bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/build.make
.PHONY : tfm_ns_signed_bin

# Rule to build all files generated by this target.
bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/build: tfm_ns_signed_bin
.PHONY : bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/build

bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/clean:
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot && $(CMAKE_COMMAND) -P CMakeFiles/tfm_ns_signed_bin.dir/cmake_clean.cmake
.PHONY : bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/clean

bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/depend:
	cd /home/sam/Desktop/trusted-firmware-m/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sam/Desktop/trusted-firmware-m /home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot /home/sam/Desktop/trusted-firmware-m/build /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot /home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/depend

