
if(NOT "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitinfo.txt" IS_NEWER_THAN "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --depth 1 --no-single-branch --progress --config "advice.detachedHead=false" "https://github.com/Mbed-TLS/mbedtls.git" "mbedcrypto-src"
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
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/Mbed-TLS/mbedtls.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout mbedtls-3.2.1 --
  WORKING_DIRECTORY "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'mbedtls-3.2.1'")
endif()

set(init_submodules FALSE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitinfo.txt"
    "/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-subbuild/mbedcrypto-populate-prefix/src/mbedcrypto-populate-stamp/mbedcrypto-populate-gitclone-lastrun.txt'")
endif()

