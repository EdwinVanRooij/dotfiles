#!/bin/sh
for file in /home/eddy/dotfiles/autostart/*
do $file 2>/dev/null &
done
