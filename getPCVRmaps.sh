#!/bin/bash
source ".vault"



if [ -z "$dir" ]
then
    echo dir varbale is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    EXIT
fi
 
touch "${dir}/bin/data.json"



cat "${dir}/bin/data.json"   | jq -j ' .data[]| "$",.stats.popularity_rank_position, "$UGC", .id,"$", .name,"$", .profile_url,"$", "$", .submitted_by.username,"$ ", .submitted_by.profile_url," ", .submitted_by.avatar.original, " DOWNLOADS TODAY; ", .stats.downloads_today," TOTAL; ", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $3","$4","$5","$6}' | uniq | sort -n > ${dir}/buuiltLIST-PCVR.csv


    git add .
    git commit -a -m "AUTO PUSH just updating map list"
    git push