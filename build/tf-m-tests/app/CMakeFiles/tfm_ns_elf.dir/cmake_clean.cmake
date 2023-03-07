file(REMOVE_RECURSE
  "../../bin/tfm_ns.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_ns_elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
