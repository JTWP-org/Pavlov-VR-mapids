#!/bin/bash
set -x
# API KEY AND PATH ARE STORED HERE
source "/home/steam/code2/modio/vault.txt"


APIKEY0="https://u-8414132.modapi.io"
APIKEY1="518aeba55ed18ca8db5de89b1cc160f3"


dir="/home/steam/code2/modio"

export dir
URL="${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset="

mods=()
for offset in {0..1000..100}; do
  api_response=$(curl -s -X GET "${URL}${offset}" -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus')

  if [ -z "$api_response" ]; then
    echo "Error: API response is empty for offset $offset"
    exit 1
  fi

  mod_data=$(echo "$api_response" | jq -c '.data[]')

  if [ "$mod_data" != "null" ]; then
    mods+=($mod_data)
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

# Update the configuration file
config_file="/home/steam/pavlovserver-SH1/Pavlov/Saved/Config/LinuxServer/Game.ini"

# Remove existing MapRotation lines
sed -i '/^MapRotation=/d' "$config_file"

# Add new MapRotation lines based on the top mods
for id in "${mod_ids[@]}"; do
  echo "MapRotation=(MapId=\"UGC${id}\",GameMode=\"TDM\")" >> "$config_file"
done
