#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

flush_swap(){
    sudo swapoff -a; 
    sudo swapon -a;
    sudo swapon --show;
    read -p "" fackEnterKey
}
