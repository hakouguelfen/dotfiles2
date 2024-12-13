#!/bin/bash 

keyboard=$(setxkbmap -query | grep "layout" | awk '{print $NF}')

echo " $keyboard"
