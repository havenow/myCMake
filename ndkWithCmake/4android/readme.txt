buildRunOnAndroidNinja.sh使用cmake和ninja构建android平台运行的可执行程序。
cmake生成build.ninja，然后ninja构建可执行程序。

ninja <--> make
build.ninja <--> Makefile

由于没有安装Android Studio和gradle，所以没有Android/Sdk/cmake/xxx/bin/cmake.exe ninja.exe
但是个人mac机器上上安装了cmake和ninja，并导出路径
buildRunOnAndroidMake.sh 没有指定生成器（-DCMAKE_GENERATOR="Ninja"），默认的Unix Makefiles生成器（生成适用于Unix或类Unix系统的Makefile文件）。

注意buildRunOnAndroidMake.sh和buildRunOnAndroidNinja.sh的区别：
buildRunOnAndroidMake.sh          buildRunOnAndroidNinja.sh
                                  -DCMAKE_GENERATOR="Ninja" \
..                                ..

make                              ninja
