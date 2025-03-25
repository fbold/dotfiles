#!/bin/bash
l=$(setxkbmap -query | grep layout | awk -F'layout: *' '{print $2}')

if [ "$l" == "es" ]
then
  setxkbmap gb
elif [ "$l" == "gb" ]
then
  setxkbmap es
else
  setxkbmap gb
fi
