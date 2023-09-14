#! /bin/bash

if [[ ! -d "build" ]]; then
    mkdir build
    cd build
else
    cd build
fi

echo "==== test $1 ===="
cmake -DTEST_CMAKE_FEATURE=$1 ..
