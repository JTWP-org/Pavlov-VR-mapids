#!/bin/bash
source "/home/steam/code2/modio/vault"

# Your API key and the initial URL

URL="${APIKEY0}/v1/games/3959/mods?api_key=${APIKEY1}&_offset="

# Initialize an empty array to store mod data
mods=()

# Loop through offsets
for offset in {0..1000..100}; do
  # Send the GET request and use jq to extract mod data
  mod_data=$(curl -s -X GET "${URL}${offset}" -H 'Accept: application/json' -H 'X-Modio-Platform: Oculus' | jq -c '.data[]')
  
  # Append the mod data to the mods array
  mods+=("$mod_data")
done

# Sort the mods by total downloads in descending order and keep the top 15
top_mods=$(echo "${mods[@]}" | jq -s 'sort_by(.stats.downloads_total) | reverse | .[:15]')

# Output the top 15 mods as JSON
echo "$top_mods" > top_mods.json
