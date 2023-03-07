file(REMOVE_RECURSE
  "../bin/bl2.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/bl2_elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
