#!/bin/sh

#用于生成库文件

set -e

export CROSS_COMPILE=x86_64-httc-linux-gnu-
#export CROSS_COMPILE=powerpc-linux-gnu-

export BUILD_PREFIX=${PWD}/build
export BUILD_HOST=--host=${CROSS_COMPILE%?}

export LDFLAGS="-L${BUILD_PREFIX}/lib"
export CFLAGS="-I${BUILD_PREFIX}/include"
export CPPFLAGS=${CFLAGS}

build()
{
    DIR=${PWD}
    cd pkg 
    rm -rf tmp && mkdir tmp && make $1
    cd ${DIR}
}

if [ ! -d ${BUILD_PREFIX} ]; then
	mkdir ${BUILD_PREFIX}
fi

if [ "$1"x == "libs"x ]; then
    build libs;
elif [ "$1"x == "bins"x ]; then
    build bins;
elif [ "$1"x == "all"x ]; then
    rm -rf ./pkg/tmp 
    build all;
elif [ "$1"x == "clean"x ]; then
    rm -rf ./pkg/tmp 
    rm -rf ./build
else
    build $1;
fi

echo -e "\n finished! \n"
