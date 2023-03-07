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
include bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.make

# Include the progress variables for this target.
include bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/progress.make

# Include the compile flags for this target's objects.
include bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o: lib/ext/mbedcrypto-src/library/x509.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o -MF CMakeFiles/bl2_mbedx509.dir/x509.o.d -o CMakeFiles/bl2_mbedx509.dir/x509.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509.c > CMakeFiles/bl2_mbedx509.dir/x509.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509.c -o CMakeFiles/bl2_mbedx509.dir/x509.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o: lib/ext/mbedcrypto-src/library/x509_create.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o -MF CMakeFiles/bl2_mbedx509.dir/x509_create.o.d -o CMakeFiles/bl2_mbedx509.dir/x509_create.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_create.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509_create.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_create.c > CMakeFiles/bl2_mbedx509.dir/x509_create.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509_create.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_create.c -o CMakeFiles/bl2_mbedx509.dir/x509_create.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o: lib/ext/mbedcrypto-src/library/x509_crl.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o -MF CMakeFiles/bl2_mbedx509.dir/x509_crl.o.d -o CMakeFiles/bl2_mbedx509.dir/x509_crl.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crl.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509_crl.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crl.c > CMakeFiles/bl2_mbedx509.dir/x509_crl.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509_crl.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crl.c -o CMakeFiles/bl2_mbedx509.dir/x509_crl.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o: lib/ext/mbedcrypto-src/library/x509_crt.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o -MF CMakeFiles/bl2_mbedx509.dir/x509_crt.o.d -o CMakeFiles/bl2_mbedx509.dir/x509_crt.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crt.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509_crt.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crt.c > CMakeFiles/bl2_mbedx509.dir/x509_crt.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509_crt.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_crt.c -o CMakeFiles/bl2_mbedx509.dir/x509_crt.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o: lib/ext/mbedcrypto-src/library/x509_csr.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o -MF CMakeFiles/bl2_mbedx509.dir/x509_csr.o.d -o CMakeFiles/bl2_mbedx509.dir/x509_csr.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_csr.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509_csr.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_csr.c > CMakeFiles/bl2_mbedx509.dir/x509_csr.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509_csr.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509_csr.c -o CMakeFiles/bl2_mbedx509.dir/x509_csr.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o: lib/ext/mbedcrypto-src/library/x509write_crt.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o -MF CMakeFiles/bl2_mbedx509.dir/x509write_crt.o.d -o CMakeFiles/bl2_mbedx509.dir/x509write_crt.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_crt.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509write_crt.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_crt.c > CMakeFiles/bl2_mbedx509.dir/x509write_crt.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509write_crt.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_crt.c -o CMakeFiles/bl2_mbedx509.dir/x509write_crt.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o: lib/ext/mbedcrypto-src/library/x509write_csr.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o -MF CMakeFiles/bl2_mbedx509.dir/x509write_csr.o.d -o CMakeFiles/bl2_mbedx509.dir/x509write_csr.o -c /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_csr.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/x509write_csr.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_csr.c > CMakeFiles/bl2_mbedx509.dir/x509write_csr.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/x509write_csr.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library/x509write_csr.c -o CMakeFiles/bl2_mbedx509.dir/x509write_csr.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o: ../platform/ext/target/stm/common/hal/accelerator/sha1_alt.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o -MF CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o.d -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o -c /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha1_alt.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha1_alt.c > CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha1_alt.c -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o: ../platform/ext/target/stm/common/hal/accelerator/sha256_alt.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o -MF CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o.d -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o -c /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha256_alt.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha256_alt.c > CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/sha256_alt.c -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.s

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/flags.make
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o: ../platform/ext/target/stm/common/hal/accelerator/stm.c
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o -MF CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o.d -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o -c /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/stm.c

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.i"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/stm.c > CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.i

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.s"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/hal/accelerator/stm.c -o CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.s

# Object files for target bl2_mbedx509
bl2_mbedx509_OBJECTS = \
"CMakeFiles/bl2_mbedx509.dir/x509.o" \
"CMakeFiles/bl2_mbedx509.dir/x509_create.o" \
"CMakeFiles/bl2_mbedx509.dir/x509_crl.o" \
"CMakeFiles/bl2_mbedx509.dir/x509_crt.o" \
"CMakeFiles/bl2_mbedx509.dir/x509_csr.o" \
"CMakeFiles/bl2_mbedx509.dir/x509write_crt.o" \
"CMakeFiles/bl2_mbedx509.dir/x509write_csr.o" \
"CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o" \
"CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o" \
"CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o"

# External object files for target bl2_mbedx509
bl2_mbedx509_EXTERNAL_OBJECTS =

bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_create.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crl.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_crt.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509_csr.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_crt.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/x509write_csr.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/__/__/__/__/__/platform/ext/target/stm/common/hal/accelerator/stm.o
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/build.make
bl2/mbedcrypto/library/libmbedx509.a: bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sam/Desktop/trusted-firmware-m/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking C static library libmbedx509.a"
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && $(CMAKE_COMMAND) -P CMakeFiles/bl2_mbedx509.dir/cmake_clean_target.cmake
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bl2_mbedx509.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/build: bl2/mbedcrypto/library/libmbedx509.a
.PHONY : bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/build

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/clean:
	cd /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library && $(CMAKE_COMMAND) -P CMakeFiles/bl2_mbedx509.dir/cmake_clean.cmake
.PHONY : bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/clean

bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/depend:
	cd /home/sam/Desktop/trusted-firmware-m/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sam/Desktop/trusted-firmware-m /home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library /home/sam/Desktop/trusted-firmware-m/build /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library /home/sam/Desktop/trusted-firmware-m/build/bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/depend

