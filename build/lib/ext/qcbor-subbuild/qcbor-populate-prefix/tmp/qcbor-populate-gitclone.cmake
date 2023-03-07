
if(NOT "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitinfo.txt" IS_NEWER_THAN "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --progress --config "advice.detachedHead=false" "https://github.com/laurencelundblade/QCBOR.git" "qcbor-src"
    WORKING_DIRECTORY "/home/sam/Desktop/trusted-firmware-m/build/lib/ext"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/laurencelundblade/QCBOR.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout b0e70332 --
  WORKING_DIRECTORY "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'b0e70332'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitinfo.txt"
    "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/qcbor-subbuild/qcbor-populate-prefix/src/qcbor-populate-stamp/qcbor-populate-gitclone-lastrun.txt'")
endif()

