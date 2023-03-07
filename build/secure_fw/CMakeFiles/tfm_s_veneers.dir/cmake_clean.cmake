file(REMOVE_RECURSE
  "libtfm_s_veneers.a"
  "libtfm_s_veneers.pdb"
  "s_veneers.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tfm_s_veneers.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
