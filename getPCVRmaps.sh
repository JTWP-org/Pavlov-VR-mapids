#!/bin/bash
source ".vault"



if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi
 
touch "${dir}/bin/data.json"

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' > "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows'  >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=500"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=600"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=700"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=800"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "${dir}/bin/data.json"  
sleep 5s

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=500"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=600"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=700"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "${dir}/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=800"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "${dir}/bin/data.json"  
sleep 5s


cat "${dir}/bin/data.json"   | jq -j ' .data[]|| | jq -j ' .data[]| "$", .stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profi  tr -d "|" | tr -d ","  | sort -n   | awk -F"$" '{print $3","$4","$5","$6}' | uniq | sort -n > ${dir}/buuiltLIST-PCVR.csv


    git add .
    git commit -a -m "AUTO PUSH just updating map list"
    git push