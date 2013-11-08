#! /bin/bash

function installF(){
    sudo apt-get install -y $1 >/dev/null 2>&1
}

list="python-dev python-pip python-pip"

echo "Installing Python and dependencies.."

for program in $list
do
    installF $program
done

sudo pip install paramiko >/dev/null 2>&1

echo "All done!" 
