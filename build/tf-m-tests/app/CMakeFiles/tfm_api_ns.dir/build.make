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
include tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/compiler_depend.make

# Include the progress variables for this target.
include tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/progress.make

# Include the compile flags for this target's objects.
include tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/flags.make

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/flags.make
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o: ../interface/src/tfm_its_api.c
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o -MF CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o.d -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o -c /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_its_api.c

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_its_api.c > CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.i

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_its_api.c -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.s

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/flags.make
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o: ../interface/src/tfm_crypto_api.c
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o -MF CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o.d -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o -c /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_crypto_api.c

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_crypto_api.c > CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.i

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_crypto_api.c -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.s

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/flags.make
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o: ../interface/src/tfm_psa_ns_api.c
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o -MF CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o.d -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o -c /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_psa_ns_api.c

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_psa_ns_api.c > CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.i

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/interface/src/tfm_psa_ns_api.c -o CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.s

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/flags.make
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o: lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o -MF CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o.d -o CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c > CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.i

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c -o CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.s

# Object files for target tfm_api_ns
tfm_api_ns_OBJECTS = \
"CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o" \
"CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o" \
"CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o" \
"CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o"

# External object files for target tfm_api_ns
tfm_api_ns_EXTERNAL_OBJECTS =

tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_its_api.o
tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_crypto_api.o
tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/__/__/interface/src/tfm_psa_ns_api.o
tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o
tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/build.make
tf-m-tests/app/libtfm_api_ns.a: tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C static library libtfm_api_ns.a"
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && $(CMAKE_COMMAND) -P CMakeFiles/tfm_api_ns.dir/cmake_clean_target.cmake
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tfm_api_ns.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/build: tf-m-tests/app/libtfm_api_ns.a
.PHONY : tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/build

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/clean:
	cd /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app && $(CMAKE_COMMAND) -P CMakeFiles/tfm_api_ns.dir/cmake_clean.cmake
.PHONY : tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/clean

tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/depend:
	cd /home/sam/Desktop/trusted-firmware-m/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sam/Desktop/trusted-firmware-m /home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app /home/sam/Desktop/trusted-firmware-m/build /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app /home/sam/Desktop/trusted-firmware-m/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/depend

