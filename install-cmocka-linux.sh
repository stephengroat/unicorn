#!/bin/sh
set -ex
mkdir -p cmocka
wget https://cmocka.org/files/1.1/cmocka-1.1.0.tar.xz -O /tmp/cmocka-1.1.0.tar.xz
tar -xf /tmp/cmocka-1.1.0.tar.xz -C /tmp
if [[ ! -z $MSYSTEM ]]; then
cd cmocka && cmake -G "MSYS Makefiles" -DUNIT_TESTING=On /tmp/cmocka-1.1.0 && make && make test
else
cd cmocka && cmake -DUNIT_TESTING=On /tmp/cmocka-1.1.0 && make && make test
fi
# cmocka does not include headers in build
cp -R /tmp/cmocka-1.1.0/include/ .
