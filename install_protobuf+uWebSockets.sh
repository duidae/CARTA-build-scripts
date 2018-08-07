#!/usr/bin/env bash

export CARTAWORKHOME=`cd ../../../ && pwd`

echo $CARTAWORKHOME

cd $CARTAWORKHOME/CARTAvis-externals/ThirdParty

# Install protocol buffer
FILE="protobuf-all-3.6.0.tar.gz"
if [ ! -f $FILE ]; then
    curl -O -L https://github.com/google/protobuf/releases/download/v3.6.0/protobuf-all-3.6.0.tar.gz
fi

DIR1="protobuf-3.6.0"
if [ -d $DIR1 ]; then
    rm -rf $DIR1
fi

DIR2="protobuf"
if [ -d $DIR2 ]; then
    rm -rf $DIR2
fi

tar xvfz protobuf-all-3.6.0.tar.gz > /dev/null

cd protobuf-3.6.0

./configure --prefix=`pwd`/../protobuf/

make 

make check

make install

cd ..

# Install uWebSockets
DIR1="uWebSockets-src"
if [ -d $DIR1 ]; then
    rm -rf $DIR1
fi

DIR1="uWebSockets"
if [ -d $DIR1 ]; then
    rm -rf $DIR1
fi

git clone https://github.com/uNetworking/uWebSockets.git uWebSockets-src

cd uWebSockets-src

make

cd ..

mkdir -p uWebSockets/lib
mkdir -p uWebSockets/include/uWS

cp uWebSockets-src/libuWS.so uWebSockets/lib
cp uWebSockets-src/src/*.h uWebSockets/include/uWS
