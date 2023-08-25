#!/bin/bash
source "shack/tmp"

cp .vault shack/tmp
cp .vault tmp

if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi
 
bash "${dir}/getPCVRmaps.sh"
cp .vault shack/.vault
bash "${dir}/shack/getSHACKmap.sh"
rm shack/tmp
rm tmp