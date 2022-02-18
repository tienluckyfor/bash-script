#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

export_folder(){
    if [ ! -f /usr/bin/zip ]
    then
        apt-get install zip
    fi
    print_fn Yellow "Path folder ($P_CODE_PATH/$P_DOMAIN_EXAMPLE/attachments): "; read FOLDER_PATH
    FOLDER_PATH=${FOLDER_PATH:-$(pwd)}
    mkdir -p "$P_CODE_PATH/backup"
    URL_ZIP=$P_CODE_PATH/backup/export_folder.zip
    zip -r export_folder.zip *
    mv export_folder.zip $URL_ZIP
    print_fn Yellow "DONE: http://$P_IP/backup/export_folder.zip"
    read -p "" fackEnterKey
}

[[ ! -f /usr/bin/zip ]] && echo "This file exists!"
