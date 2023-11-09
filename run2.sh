#!/bin/bash

source "/home/steam/code2/modio/vault"

URL="${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset="

mods=()
for offset in {0..1000..100}; do
  api_response=$(curl -s -X GET "${URL}${offset}" -H 'Accept: application/json' -H 'X-Modio-Platform: platforms=oculus' -H 'X-Modio-map'    )
  
  if [ -z "$api_response" ]; then
    echo "Error: API response is empty for offset $offset"
    exit 1
  
  
  mod_data=$(echo "$api_response" | jq -c '.data[]')

  if [ "$mod_data" != "null" ]; then
    mods+=("$mod_data")
  else
    echo "Warning: No data found for offset $offset"
  fi
done

if [ ${#mods[@]} -eq 0 ]; then
  echo "Error: No mod data found."
  exit 1
fi

top_mods=$(echo "${mods[@]}" | jq -s 'sort_by(.stats.downloads_today) | reverse | .[:25]')
mod_ids=($(echo "$top_mods" | jq '.[].id'))

if [ ${#mod_ids[@]} -eq 0 ]; then
  echo "Error: No top mods found."
  exit 1
fi

# Remove old MapRotation lines from Game.ini
sed -i '/^MapRotation=/d' /home/steam/pavlovserver-SH1/Pavlov/Saved/Config/LinuxServer/Game.ini

# Append the new MapRotation lines
for id in "${mod_ids[@]}"; do
  echo "MapRotation=(MapId=\"UGC${id}\",GameMode=\"TDM\")" >> /home/steam/pavlovserver-SH1/Pavlov/Saved/Config/LinuxServer/Game.ini
done

