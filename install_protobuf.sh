#!/bin/bash

export CARTAWORKHOME=`cd ../../../ && pwd`

echo $CARTAWORKHOME

cd $CARTAWORKHOME/CARTAvis-externals/ThirdParty

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

# sudo ldconfig # refresh shared library cache.

cd ..

