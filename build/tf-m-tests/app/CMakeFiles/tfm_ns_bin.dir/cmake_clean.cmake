file(REMOVE_RECURSE
  "../../bin/tfm_ns.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_ns_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
