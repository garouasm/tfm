file(REMOVE_RECURSE
  "../bin/tfm_s.hex"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_s_hex.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
