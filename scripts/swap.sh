#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

create_swap(){
    print_fn Yellow "Check swap exits.."
    sudo swapon --show
    print_fn Yellow "free -h"
    free -h
    print_fn Yellow "df -h"
    df -h
    print_fn Yellow "Create swapfile (2|4|10) GB: "; read size
    if [ $size ]
    then
        print_fn Red "Delete swapfile"
        swapoff /swapfile
        sudo rm /swapfile

        sudo fallocate -l $(expr $size)G /swapfile
        sudo chmod 600 /swapfile
        print_fn Yellow "Make swap"
        sudo mkswap /swapfile
        sudo swapon /swapfile
        print_fn Yellow "Check again"
        sudo swapon --show
        free -h
        print_fn Yellow "Permanent"
        sudo cp /etc/fstab /etc/fstab.bak
        echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
        cat /proc/sys/vm/swappiness
        print_fn Yellow "DONE: Create Swapfile!" 
        read -p "" fackEnterKey
    else
        print_fn Red "SKIP!!!"
    fi
}
