# 
```
CMake是一个跨平台的构建系统，它支持多种不同的生成器来生成特定的构建系统文件。以下是一些常见的CMake生成器：
1、Unix Makefiles：生成适用于Unix或类Unix系统的Makefile文件。这是CMake的默认生成器。
2、Ninja：生成Ninja构建系统的build.ninja文件。Ninja是一个快速且并行构建系统。
3、Visual Studio：生成适用于Microsoft Visual Studio的项目和解决方案文件。您可以选择生成不同版本的Visual Studio项目文件，如Visual Studio 2010、2012、2013等。
4、Xcode：生成适用于Apple Xcode的项目文件。这些项目文件可以用于构建和运行在Mac OS上的应用程序。
5、CodeBlocks：生成适用于Code::Blocks IDE的项目文件。
6、Eclipse CDT4：生成适用于Eclipse的C/C++开发工具包（CDT）的项目文件。
7、Sublime Text 2：生成适用于Sublime Text 2编辑器的项目文件。
8、Qt Creator：生成适用于Qt Creator集成开发环境的项目文件。
这些只是一些常见的CMake生成器，还有其他一些生成器可供选择。您可以使用cmake --help命令来查看您的CMake版本支持的所有生成器。
使用-G选项可以显式地指定要使用的生成器.
例如cmake -G "Ninja" 、cmake -G "Xcode"、cmake  -G "Visual Studio 16 2019"
```
# 
```
-DCMAKE_OSX_ARCHITECTURES是一个CMake变量，用于指定在macOS上构建时要使用的目标架构。
在macOS上，可以使用不同的架构进行构建，例如x86_64（64位Intel）和arm64（Apple Silicon）。使用-DCMAKE_OSX_ARCHITECTURES选项，您可以明确指定要使用的目标架构。
cmake -DCMAKE_OSX_ARCHITECTURES=x86_64 ..  
cmake -DCMAKE_OSX_ARCHITECTURES=arm64 ..  
cmake -DCMAKE_OSX_ARCHITECTURES=x86_64,arm64 ..
```
