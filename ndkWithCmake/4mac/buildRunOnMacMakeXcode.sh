export ANDOIRD_NDK=/Users/wangfeng/Documents/NDK
export BUILD_ABI=Xcode

rm -r $BUILD_ABI
mkdir $BUILD_ABI

cmake \
-BXcode \
-DCMAKE_OSX_ARCHITECTURES=arm64 \
-DCMAKE_GENERATOR="Xcode" \
.
