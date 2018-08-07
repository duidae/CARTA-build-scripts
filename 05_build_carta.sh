#!/bin/bash

export PATH=/usr:$PATH

export PATH=/usr/local/lib:$PATH

export PATH=/opt/Qt/5.7/gcc_64/bin:$PATH

qmake --version

export CARTAWORKHOME=`cd ../ && pwd`

echo $CARTAWORKHOME

######################################

mkdir -p $CARTAWORKHOME/CARTAvis/build

######################################

cd $CARTAWORKHOME/CARTAvis/build

#qmake NOSERVER=1 CARTA_BUILD_TYPE=dev $CARTAWORKHOME/CARTAvis/carta -r
qmake NOSERVER=1 CARTA_BUILD_TYPE=bughunter $CARTAWORKHOME/CARTAvis/carta -r

make -j2


