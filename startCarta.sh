#!/bin/bash

#./deleteCache.sh

export CARTAWORKHOME=`cd ../ && pwd`

export LD_LIBRARY_PATH=$CARTAWORKHOME/CARTAvis-externals/ThirdParty/protobuf/lib:$CARTAWORKHOME/CARTAvis-externals/ThirdParty/uWebSockets/lib:$CARTAWORKHOME/CARTAvis-externals/ThirdParty/gsl-2.3-src/.libs:${LD_LIBRARY_PATH}

ulimit -n 2000

$CARTAWORKHOME/CARTAvis/build/cpp/desktop/CARTA
