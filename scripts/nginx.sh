#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

nginx(){
    SITE_TYPE=$1 
    ROOT_PATH=$2

    print_fn Yellow "List domains.."
    sudo nginx -T | grep "server_name " | sed 's/.*server_name \(.*\);/\1/' | sed 's/ /\n/'

    print_fn Yellow "Domain ($P_DOMAIN_EXAMPLE): "; read SERVER_NAME_DOMAIN
    # print_fn Yellow "Path index.php index.html: "; read ROOT_PATH

    cp $P_BASHSCRIPT_PATH/configs/$SITE_TYPE-nginx.conf $P_NGINX_PATH/$SERVER_NAME_DOMAIN.conf
    sed -i -r "s#SERVER_NAME_DOMAIN#${SERVER_NAME_DOMAIN//#/\\#} www.${SERVER_NAME_DOMAIN//#/\\#}#" $P_NGINX_PATH/$SERVER_NAME_DOMAIN.conf
    sed -i -r "s#ROOT_PATH#${ROOT_PATH//#/\\#}#" $P_NGINX_PATH/$SERVER_NAME_DOMAIN.conf

    if [ $SITE_TYPE == "expressjs" ]
    then
        print_fn Yellow "Location name ($P_LOCATION_NAME_EXAMPLE): "; read LOCATION_NAME
        sed -i -r "s#LOCATION_NAME#${LOCATION_NAME//#/\\#}#" $P_NGINX_PATH/$SERVER_NAME_DOMAIN.conf

        print_fn Yellow "Location PORT ($P_LOCATION_PORT_EXAMPLE): "; read LOCATION_PORT
        sed -i -r "s#LOCATION_PORT#${LOCATION_PORT//#/\\#}#" $P_NGINX_PATH/$SERVER_NAME_DOMAIN.conf
    fi

    service nginx reload
}

expressjs_nginx_part(){
    SITE_TYPE="expressjs_part"
    # ROOT_PATH="$(pwd)"
    # nginx $SITE_TYPE $ROOT_PATH
}

expressjs_nginx(){
    SITE_TYPE="expressjs"
    ROOT_PATH="$(pwd)"
    nginx $SITE_TYPE $ROOT_PATH
}

reactjs_nginx(){
    SITE_TYPE="reactjs"
    ROOT_PATH="$(pwd)/after_build"
    nginx $SITE_TYPE $ROOT_PATH
}

laravel_nginx(){
    SITE_TYPE="laravel"
    ROOT_PATH="$(pwd)/public"
    nginx $SITE_TYPE $ROOT_PATH
}

wordpress_nginx(){
    SITE_TYPE="wordpress"
    ROOT_PATH="$(pwd)"
    nginx $SITE_TYPE $ROOT_PATH
}
