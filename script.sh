#! /bin/sh
cp -f sub/main_ns.c build/lib/ext/tfm_test_repo-src/app/main_ns.c 
cp -f sub/tfm_ns_interface.c build/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c
cd build
cmake --build ./  -- install 
./postbuild.sh 
./regression.sh 
./TFM_UPDATE.sh  
