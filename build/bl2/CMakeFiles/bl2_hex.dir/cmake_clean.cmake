file(REMOVE_RECURSE
  "../bin/bl2.hex"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/bl2_hex.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
