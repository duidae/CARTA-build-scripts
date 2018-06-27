#!/bin/bash

export CARTAWORKHOME=`cd ../ && pwd`

echo $CARTAWORKHOME

cd $CARTAWORKHOME/CARTAvis/carta/html5/common/skel

./generate.py

