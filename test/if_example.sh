#!/bin/bash
# Basic if statement

# if [ $1 -gt 100 ]
# then
# echo Hey that\'s a large number.
# pwd
# fi
# date

read STR
if [ $STR -a $STR = "y" ]
then
# if [ $STR -a $STR = "y" ];then
    echo "then"
else
    echo "else"
fi
