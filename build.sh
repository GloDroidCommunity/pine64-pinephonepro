#!/bin/bash

echo Building the Android
pushd aosptree
. build/envsetup.sh
lunch pine64_pinephonepro-userdebug
make images -k || make images -j1
make sdcard
popd
