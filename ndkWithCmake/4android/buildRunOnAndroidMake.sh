export ANDOIRD_NDK=/Users/wangfeng/Documents/NDK
export BUILD_ABI=arm64-v8a

rm -r $BUILD_ABI
mkdir $BUILD_ABI
cd $BUILD_ABI

cmake \
-DANDROID_ABI=$BUILD_ABI \
-DANDROID_PLATFORM=android-21 \
-DCMAKE_BUILD_TYPE=Debug \
-DANDROID_NDK=$ANDOIRD_NDK \
-DCMAKE_TOOLCHAIN_FILE=$ANDOIRD_NDK/build/cmake/android.toolchain.cmake \
-DANDROID_TOOLCHAIN=clang \
..

make
cd ..
