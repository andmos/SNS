#! /bin/bash

function disableBoot(){
    sudo update-rc.d -f $1 defaults
    update-rc.d -f $1 remove
    sudo service $1 stop
}


list="fail2ban"

echo "Disabling processes from startup: "
for program in $list
do
    disableBoot $program >/dev/null 2>&1 

done

echo "All done." 

