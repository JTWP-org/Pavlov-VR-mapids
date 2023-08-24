#!/bin/bash
source ".vault"


if test -f "$FILE"; then
    echo "$FILE exists."
fi


if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi
 
bash "${dir}/getPCVRmaps.sh"
bash "${dir}/shack/getSHACKmap.sh"