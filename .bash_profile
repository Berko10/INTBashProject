#!/bin/bash
echo "Hello $USER"

export COURSE_ID="DevOpsTheHardWay"
token_file="$HOME/.token"

if [ -e $"token_file" ]; then
	fileperm=$(stat -c "%a" "$token_file")
        if [ "$fileperm" -ne 600 ]; then
                echo "Warning: .token file has too open permissions"
        fi
fi

umask 007

export PATH="$PATH:/home/$USER/usercommands"

currentDate=$(date -u +"%Y-%m-%dT%H:%M:%S%:z")
echo "The current date is: $currentDate"

alias ltxt="ls *.txt"

homeDir="$HOME/tmp"
if [ -d "$homeDir" ]; then
        rm -rf "$homeDir"/*
else
        mkdir "$homeDir"
fi
if [ sudo fuser 8080/tcp &>/dev/null ]; then
        sudo fuser -k 8080/tcp
fi
