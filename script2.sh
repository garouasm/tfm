#! /bin/sh
cp -f sub2/main_ns.c build_slave2/lib/ext/tfm_test_repo-src/app/main_ns.c 
cp -f sub2/tfm_ns_interface.c build_slave2/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c
cd build_slave2
cmake --build ./  -- install 
chmod -R 777 . 
echo "scripts replaced" 
./postbuild.sh 
./regression.sh 
./TFM_UPDATE.sh  