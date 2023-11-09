#!/bin/bash

# 1. Add the current date to the server name in Game.ini
current_date=$(date +'%m/%d')
sed -i 's|ServerName=.*$|ServerName=MOST DOWNLOADED '"$current_date"' UPDATED DAILY JTWP.org|' /home/steam/pavlovserver-SH1/Pavlov/Saved/Config/LinuxServer/Game.ini

# 2. Run the script to fetch the list of IDs and store them in a temporary file
/home/steam/code2/modio/run2.sh > /tmp/top_mods.txt

# 3. Append the IDs to Game.ini as MapRotation lines
while IFS= read -r id; do
  echo "MapRotation=(MapId=\"UGC$id\",GameMode=\"TDM\")" >> /home/steam/pavlovserver-SH1/Pavlov/Saved/Config/LinuxServer/Game.ini
done < /tmp/top_mods.txt
