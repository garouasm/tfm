file(REMOVE_RECURSE
  "tfm_s_signed.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_s_signed_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
