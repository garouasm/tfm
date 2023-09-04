#! /bin/sh
cd build 
echo "build dir" 
cmake --build ./  -- install 
chmod -R 777 .
cp -f ../sub/regression.sh regression.sh 
cp -f ../sub/TFM_UPDATE.sh TFM_UPDATE.sh 
echo "scripts sub" 
./postbuild.sh 
./regression.sh 
./TFM_UPDATE.sh 

