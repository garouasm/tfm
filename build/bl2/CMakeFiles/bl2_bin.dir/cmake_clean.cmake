file(REMOVE_RECURSE
  "../bin/bl2.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/bl2_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
