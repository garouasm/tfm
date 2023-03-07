file(REMOVE_RECURSE
  "tfm_ns_signed.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_ns_signed_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
