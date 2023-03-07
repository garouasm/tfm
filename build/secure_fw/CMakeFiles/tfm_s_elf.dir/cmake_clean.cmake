file(REMOVE_RECURSE
  "../bin/tfm_s.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_s_elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
