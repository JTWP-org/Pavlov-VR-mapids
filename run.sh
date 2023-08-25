#!/bin/bash

dir="/home/steam/code2/modio"

if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi
 
source "${dir}/vault"
 
bash "${dir}/getPCVRmaps.sh"
bash "${dir}/shack/getSHACKmap.sh"
