#!/bin/bash
# SET THIS TO WHERE SCRIPT IS 

dir="/home/steam/code2/modio/shack"

source "/home/steam/code2/modio/shack/.vault"

 
touch "/home/steam/code2/modio/shack/bin/data.json"

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' > "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=500"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=600"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=700"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=800"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=500"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=600"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=700"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=800"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s


cat "/home/steam/code2/modio/bin/data.json"   | jq -j ' .data[]| "$",.stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", "$", .submitted_by.username,"$ ", .submitted_by.profile_url," ", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $2","$3","$4","$5}' | uniq  > /home/steam/code2/modio/buuiltLIST-PCVR.csv


