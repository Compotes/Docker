#!/bin/bash

docker build -t chibios .

echo "Enter password to create link to ctmake"

link="/usr/bin/ctmake"

if [ -f "$link" ]
then
    echo "recreating $link"
    sudo rm "$link"
else
    echo "creating $link"
fi
sudo ln -s $(pwd)/chmake "$link"
