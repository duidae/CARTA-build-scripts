#!/bin/bash

export CARTAWORKHOME=`cd ../ && pwd`

echo $CARTAWORKHOME

TARGETOS=linux

echo $TARGETOS

cd $CARTAWORKHOME/CARTAvis-externals/ThirdParty

export PATH=/usr:$PATH

################ build CASA core ###############################

mkdir casa

cd casa

git clone --recursive https://github.com/cartavis/casa.git trunk

cd trunk

cd casacore

mkdir build 

cd build

cmake -DBoost_NO_BOOST_CMAKE=1 -DCASA_BUILD=1 -DBUILD_TESTING=OFF \
  -DCMAKE_INSTALL_PREFIX=../../$TARGETOS -DBUILD_PYTHON=1 \
  -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
  -DPYTHON_LIBRARY=/usr/lib64/libpython2.7.so \
  -DWCSLIB_ROOT_DIR=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/wcslib \
  -DCFITSIO_ROOT_DIR=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/cfitsio \
  -DCMAKE_BUILD_TYPE=Release \
  -DCXX11=1 ..

make -j2

make install

################ build CASA code ###############################

cd ../../code

mkdir build 

cd build

cmake -DUseCrashReporter=0 -DBoost_NO_BOOST_CMAKE=1 -DEXTRA_C_FLAGS=-DPG_PPU \
  -DWCSLIB_ROOT_DIR=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/wcslib \
  -DCFITSIO_ROOT_DIR=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/cfitsio \
  -DQWT_ROOT_DIR=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/qwt-6.1.0 \
  -DLIBSAKURA_ROOT_DIR=/opt/casa/01/lib/libsakura/default/ \
  -Darch=$TARGETOS -DCMAKE_BUILD_TYPE=Release ..

make -j2


################# build CASA link ##############################

mkdir -p $CARTAWORKHOME/CARTAvis-externals/ThirdParty/casacore
mkdir -p $CARTAWORKHOME/CARTAvis-externals/ThirdParty/imageanalysis

cd $CARTAWORKHOME/CARTAvis-externals/ThirdParty/imageanalysis
ln -s $CARTAWORKHOME/CARTAvis-externals/ThirdParty/casa/trunk/$TARGETOS/include/casacode/ include
ln -s $CARTAWORKHOME/CARTAvis-externals/ThirdParty/casa/trunk/$TARGETOS/lib lib

cd ../casacore
ln -s $CARTAWORKHOME/CARTAvis-externals/ThirdParty/casa/trunk/$TARGETOS/include/ include
ln -s $CARTAWORKHOME/CARTAvis-externals/ThirdParty/casa/trunk/$TARGETOS/lib lib

