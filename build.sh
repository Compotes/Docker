#!/bin/bash

docker build -t chibios .

echo "Enter password to create link to ctcmd"

link="/usr/bin/ctcmd"

if [ -f "$link" ]
then
    echo "recreating $link"
    sudo rm "$link"
else
    echo "creating $link"
fi
sudo ln -s $(pwd)/chmake "$link"
