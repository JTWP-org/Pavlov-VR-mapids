#!/bin/bash
# SET THIS TO WHERE SCRIPT IS 

dir="/home/steam/code2/modio/shack"

source "/home/steam/code2/modio/shack/.vault"

 
touch "/home/steam/code2/modio/shack/bin/data.json"

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows' > "/home/steam/code2/modio/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: Windows'  >> "/home/steam/code2/modio/bin/data.json"  
sleep 5s

cat "/home/steam/code2/modio/bin/data.json"   | jq -j '"$" .data[]| .stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", "$", .submitted_by.username,"$ ", .submitted_by.profile_url," ", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $2","$3","$4}' > /home/steam/code2/modio/pcvrMaps.json

touch "/home/steam/code2/modio/shack/bin/data.json"

curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux' > "/home/steam/code2/modio/bin/data2.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: linux'  >> "/home/steam/code2/modio/bin/data2.json"  
sleep 5s

cat "/home/steam/code2/modio/bin/data2.json"   | jq -j ' "$".data[]| .stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", "$", .submitted_by.username,"$ ", .submitted_by.profile_url," ", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $2","$3","$4}' > /home/steam/code2/modio/pcvrMaps.json


  