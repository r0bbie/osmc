# (c) 2014 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

echo -e "Building armmem for Raspberry Pi"
out=$(pwd)/files
if [ -d files/usr ]; then rm -rf files/usr; fi
cd src
make clean
make
if [ $? != 0 ]; then echo "Error occured during build" && exit 1; fi
strip_libs
mkdir -p $out/usr/lib
cp -ar libarmmem.so $out/usr/lib
cp -ar libarmmem.a $out/usr/lib
cd ../
dpkg -b files/ rpi-armmem.deb
