#!/bin/bash
# SET THIS TO WHERE SCRIPT IS 
dir="/home/steam/code2/modio"

  source ".vault"

 

  curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=0"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  > data.json  
  sleep 5s
  curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=100"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> data.json  
  sleep 5s
  curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=200"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> data.json  
  sleep 5s
  curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=300"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> data.json  
  sleep 5s> data.json  
  curl -X GET "${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset=400"     -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus'  >> data.json  
  sleep 5s

cat data.json | jq -c J 


  echo "UGC,NAME,URL" > "${dir}/rankedPavlov.csv"

  cat "sorted3.json" | jq -j ' .data[]| .stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", .submitted_by.username," ", .submitted_by.profile_url," ", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", "\n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $2","$3","$4}' >> "${dir}/rankedPavlov.csv"


  cat "sorted3.json" |  column -s "," -t > table-rankedPavlov.txt


  git add * ; git commit -m "Send it $(date)" ; git push 

  #bash "${dir}/discord.sh" \
  #  --webhook-url="${HOOK}" \
  #  --file "${dir}/rankedPavlov.csv" \
  #  --text "todays pavlov maps by most downloads in the day \\n list rebuilt every hour "

  sleep 1h
  
done