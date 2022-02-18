#!/bin/bash
# . "${BASH_SOURCE%/*}/../.env"
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

list_db(){
    print_fn Yellow "Databases"
    mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "show databases;"
}

add_db(){
    list_db
    print_fn Yellow "Add DB ($P_DB_EXAMPLE): "; read DB_NAME
    if [ $DB_NAME ]
    then
        mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "CREATE DATABASE $DB_NAME;"
        mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "CREATE USER '$P_DB_USERNAME' IDENTIFIED BY '$P_DB_PASSWORD';"
        mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$P_DB_USERNAME';"
        print_fn Yellow "DONE: create db $DB_NAME!" 
        read -p "" fackEnterKey 
    else
        print_fn Red "SKIP!!!"
    fi
}
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$P_DB_USERNAME';
import_db_local(){
    list_db
    print_fn Yellow "Import DB ($P_DB_EXAMPLE): "; read DB_IMPORT
    print_fn Yellow "Path DB ($P_CODE_PATH/$P_DB_EXAMPLE.sql): "; read PATH_DB_IMPORT
    if [ $DB_IMPORT -a $PATH_DB_IMPORT ]
    then
        mysql --user=$P_DB_ROOT --password=$P_DB_PASSWORD $DB_IMPORT < $PATH_DB_IMPORT
        print_fn Yellow "DONE!!!"
        read -p "" fackEnterKey 
    else
        print_fn Red "SKIP!!!"
    fi
}

import_db_url(){
    list_db
    print_fn Yellow "Import DB ($P_DB_EXAMPLE): "; read DB_IMPORT
    print_fn Yellow "URL DB (http://xxx$P_CODE_PATH/$P_DB_EXAMPLE.sql): "; read URL_DB_IMPORT
    if [ $DB_IMPORT -a $URL_DB_IMPORT ]
    then
        PATH_DB_IMPORT=$P_BASHSCRIPT_PATH/storages/$P_DB_EXAMPLE.sql
        wget -O $PATH_DB_IMPORT $URL_DB_IMPORT
        mysql --user=$P_DB_ROOT --password=$P_DB_PASSWORD $DB_IMPORT < $PATH_DB_IMPORT
        print_fn Yellow "DONE!!!"
        read -p "" fackEnterKey 
    else
        print_fn Red "SKIP!!!"
    fi
}

export_db(){
    list_db
    print_fn Yellow "Export DB ($P_DB_EXAMPLE): "; read DB_EXPORT
    if [ $DB_EXPORT ]
    then
        mkdir -p "$P_CODE_PATH/backup"
        mysqldump -u $P_DB_ROOT --quote-names --opt --single-transaction --quick $DB_EXPORT > "$P_CODE_PATH/backup/$DB_EXPORT.sql"
        print_fn Yellow "DONE: http://$P_IP/backup/$DB_EXPORT.sql" 
        read -p "" fackEnterKey
    else
        print_fn Red "SKIP!!!"
    fi
}
