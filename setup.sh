#!/bin/bash

name=$1
type=$2
optionnal=$3

if [ $type = "gateway" ] || [ $type = "nofront" ] ||  [ $type = "front" ]
then

    cd /srv/readresolve.tech/
    mkdir $name
    cd $name
    mkdir api

    echo "Directories api created for app: " $name

    cd /var/lock/
    mkdir $name
    cd $name
    mkdir api

    echo "Directory properties created for app: " $name

    cd /var/log
    mkdir $name

    echo "Directory logs created for app: " $name
else 
    echo "No valid type, you can use gateway, nofront or front"
fi

if [ $type = "nofront" ] || [ $type = "front" ]
then
    cd /srv/readresolve.tech/
    cd $name
    mkdir db

    echo "Directory database created for app: " $name
else
    echo "No directory for database"
fi
if [ $type = "front" ]
then
    mkdir www

    echo "Directory www created for app: " $name

    cd /var/lock/
    cd $name
    mkdir ui

    echo "Directory for env.json created for app: " $name
else
    echo "No directory for ui"
fi

if [ -z $optionnal ]
then 
    echo "No optionnal argument"
else    
    options=$(echo "$optionnal" | tr "," "\n")
    cd /tmp/
    mkdir $name
    cd $name
    for option in $options
    do
        mkdir $option
        echo "Temporary directory created: " $option
    done
fi