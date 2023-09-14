buildRunOnAndroidNinja.sh使用cmake和ninja构建android平台运行的可执行程序。
cmake生成build.ninja，然后ninja构建可执行程序。

ninja <--> make
build.ninja <--> Makefile

由于没有安装Android Studio和gradle，所以没有Android/Sdk/cmake/xxx/bin/cmake.exe ninja.exe
