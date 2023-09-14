export ANDOIRD_NDK=/Users/wangfeng9/Documents/NDK
export BUILD_ABI=build

rm -r $BUILD_ABI
mkdir $BUILD_ABI
cd $BUILD_ABI

cmake \
-DCMAKE_OSX_ARCHITECTURES=arm64 \
..

make
cd ..
