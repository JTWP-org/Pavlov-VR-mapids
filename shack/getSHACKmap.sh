#!/bin/bash




source $(echo "${dir}/.vault")
echo $dir
 if [ -z "$dir" ]
then
    echo dir  is empty enter the scripts location into the varbale dir in .vault file or script wont work 
    exit 0
else
    echo "dir check passed"
fi



cat "${dir}/shack/bin/data.json"   | jq -j ' .data[]| "$ ",.stats.popularity_rank_position, "$ UGC", .id,"$ ", .name,"$", .profile_url, "$ ", .submitted_by.username, "$ ", .submitted_by.profile_url," $", .submitted_by.avatar.original, "$  DOWNLOADS TODAY/TOTAL; ", .stats.downloads_today,"/", .stats.downloads_total," RANK; ", " \n"  ' | tr -d "|" | tr -d ","  | sort -n  | awk -F"$" '{print $3","$4","$5","$6 " "$9}' | uniq | sort -n  > "${dir}/buuiltLIST-SHACK.csv"




git add .
git commit -a -m "AUTO PUSH just updating map list"
git push