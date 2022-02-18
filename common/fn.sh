#!/bin/bash
source "${BASH_SOURCE%/*}/config.sh"

print_fn(){
    STR="" 
    while :
    do
    case $1 in 
        Cyan)
            STR="$Cyan$2"
            break
            ;;
        Purple)
            STR="$Purple$2"
            break
            ;;
        Yellow)
            STR="$Yellow$2"
            break
            ;;
        Green)
            STR="$Green$2"
            break
            ;;
        Red)
            STR="$Red$2"
            break
            ;;
        *)
            STR="$1"
            break
            ;;
    esac
    done
    STR="\n$STR$Color_Off"
    echo -e $STR
}

