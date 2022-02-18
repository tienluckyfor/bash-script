
#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

setup_phpmyadmin(){
    sudo apt install -y php-json php-mbstring
    wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
    tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
    sudo mv phpMyAdmin-5.0.2-all-languages $P_PHPMYADMIN_PATH
    sudo cp -pr ${P_BASHSCRIPT_PATH}/configs/phpMyAdmin/config.inc.php $P_PHPMYADMIN_PATH/config.inc.php

    sed -i -r "s#P_DB_USERNAME#${P_DB_USERNAME//#/\\#}#" $P_PHPMYADMIN_PATH/config.inc.php
    sed -i -r "s#P_DB_PASSWORD#${P_DB_PASSWORD//#/\\#}#" $P_PHPMYADMIN_PATH/config.inc.php
        
    mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "CREATE USER '$P_DB_USERNAME' IDENTIFIED BY '$P_DB_PASSWORD';"
    mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "GRANT ALL PRIVILEGES ON *.* TO '$P_DB_USERNAME';"
    mysql -u $P_DB_ROOT -p$P_DB_PASSWORD -Bse "FLUSH PRIVILEGES;"

    sudo cp -pr ${P_BASHSCRIPT_PATH}/configs/phpMyAdmin/phpMyAdmin.conf $P_NGINX_PATH/phpMyAdmin.conf
    sed -i -r "s#P_PHPMYADMIN_PATH#${P_PHPMYADMIN_PATH//#/\\#}#" $P_NGINX_PATH/phpMyAdmin.conf

    mkdir -p -m 777 $P_PHPMYADMIN_PATH/tmp
    sudo systemctl restart nginx
    sudo systemctl restart php7.4-fpm

    print_fn Yellow "DONE: http://$P_IP:88"
    read -p "" fackEnterKey
}
