file(REMOVE_RECURSE
  "../../bin/tfm_ns.hex"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_ns_hex.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
