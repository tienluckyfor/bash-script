#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

init_lemp(){
#
#   INSTALL LEMP
#
# print_fn Yellow "INSTALL Linux Nginx Mariadb PHP (y/n): "; read is_install
# if [ $is_install -a $is_install = "y" ]
# then
    sudo apt update && sudo apt upgrade -y
# php
    sudo apt install php7.4-fpm -y
    sudo apt-get install php7.4-gd -y
    sudo apt-get install php7.4-imagick -y
    upload_max_filesize=200M
    post_max_size=200M
    max_execution_time=100
    max_input_time=223
    for key in upload_max_filesize post_max_size max_execution_time max_input_time
    do
        sed -i "s/^\($key\).*/\1 $(eval echo = \${$key})/" /etc/php/7.4/fpm/php.ini
    done
    /etc/init.d/php7.4-fpm restart
# nginx
    sudo apt install nginx -y
# mariadb
    sudo apt install mariadb-server php-mysql -y
    sudo mysql_secure_installation <<<$(printf "\nY\n$P_DB_PASSWORD\n$P_DB_PASSWORD\n")
# # mysql
#     sudo apt install mysql-server php-mysql -y
#     # sudo mysql_secure_installation <<<$(printf "\nY\nY\nY\nY\n$P_DB_PASSWORD\n$P_DB_PASSWORD\n")
#     # sudo mysql_secure_installation <<<$(printf "\n$P_DB_PASSWORD\n$P_DB_PASSWORD\nY\nY\nNo\nY\nY\n")
#     # sudo mysql_secure_installation <<<$(printf "\n1\n1")
#     # sudo mysql_secure_installation <<<$(printf "\nvantien123\nvantien123\nY\nY\nNo\nY\nY\n")
#     bash "${P_BASHSCRIPT_PATH}/scripts/mysql_secure.sh"
    
# ssl
    sudo apt-get install software-properties-common
    sudo add-apt-repository universe <<<$(printf "\n")
    sudo apt-get install certbot python3-certbot-nginx -y
# else
#     print_fn Red "SKIP!!!"
# fi

if grep -q "location ~ .php" "$P_NGINX_PATH/default"
then
    print_fn Red "Already exist!"
else
    nginx_php="\nlocation ~ \.php$ {\ninclude snippets/fastcgi-php.conf;\nfastcgi_pass unix:/var/run/php/php7.4-fpm.sock;\n}"
    sed -i -r "s#server_name _;#server_name _;${nginx_php//#/\\#}#" $P_NGINX_PATH/default
    service nginx reload
fi

# composer
apt install composer -y
apt install npm -y

# IP=$(hostname -I | cut -d' ' -f1)
print_fn Yellow "DONE: http://$P_IP/install-lemp.php"
echo "<?php phpinfo();" > $P_CODE_PATH/install-lemp.php

read -p "" fackEnterKey
echo "P_PATH='/var/www/bash-script'; alias ppe='source $P_PATH/.env; bash $P_PATH/menu.sh'" > ~/.bash_aliases; source ~/.bash_aliases;
}