#! /bin/sh
cd build 
echo "build dir" 
sudo rm -r ../build/* 
echo "build delete" 
cmake .. -DTFM_PLATFORM=stm/b_u585i_iot02a -DCMAKE_BUILD_TYPE=Debug -DCONFIG_TFM_SPM_BACKEND=IPC -DTFM_TOOLCHAIN_FILE=../toolchain_GNUARM.cmake -G"Unix Makefiles" 
cp -f ../sub/main_ns.c lib/ext/tfm_test_repo-src/app/main_ns.c 
cp -f ../sub/tfm_ns_interface.c lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c 
cp -f ../sub/crypto_values.h lib/ext/mbedcrypto-src/include/psa/crypto_values.h 
cp -f ../sub/psa_crypto.c lib/ext/mbedcrypto-src/library/psa_crypto.c 
echo "files replaced" 
cmake --build ./  -- install 
chmod -R 777 . 
cp -f ../sub/regression.sh regression.sh 
cp -f ../sub/TFM_UPDATE.sh TFM_UPDATE.sh 
echo "scripts replaced" 
./postbuild.sh 
./regression.sh 
./TFM_UPDATE.sh 

