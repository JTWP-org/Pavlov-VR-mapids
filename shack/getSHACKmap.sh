#!/bin/bash




source "${dir}\.vault"

 if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi


curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus' > "${dir}/shack/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> "${dir}/shack/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> "${dir}/shack/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> "${dir}/shack/bin/data.json"  
sleep 5s
curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> "${dir}/shack/bin/data.json"  
sleep 5s
cat "${dir}/shack/bin/data.json"   | jq -j ' .data[]| "$",.stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", "$", .submitted_by.username,"$ ", .submitted_by.profile_url," $", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $3","$4","$5","$6}' | uniq | sort -n  > "${dir}/buuiltLIST-SHACK.csv"




git add .
git commit -a -m "AUTO PUSH just updating map list"
git push