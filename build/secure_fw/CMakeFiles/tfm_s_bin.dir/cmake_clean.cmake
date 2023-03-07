file(REMOVE_RECURSE
  "../bin/tfm_s.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_s_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
