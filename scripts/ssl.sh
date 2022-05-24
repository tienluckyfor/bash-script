#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

# print_fn Yellow "List domains.."
# sudo nginx -T | grep "server_name " | sed 's/.*server_name \(.*\);/\1/' | sed 's/ /\n/'

# print_fn Yellow "Install Certbot (y/n): "; read is_install
# if [ $is_install -a $is_install = "y" ]
# then
#     sudo apt-get update
#     sudo apt-get install software-properties-common
#     sudo add-apt-repository universe
#     # sudo add-apt-repository ppa:certbot/certbot
#     # sudo apt-get update
#     sudo apt-get install certbot python3-certbot-nginx -y
#     print_fn Yellow "DONE: Install Certbot!"
# else
#     print_fn Red "SKIP!!!"
# fi
ssl(){
    sudo nginx -T | grep "server_name " | sed 's/.*server_name \(.*\);/\1/' | sed 's/ /\n/'
    print_fn Yellow "Add SSL Site ($P_DOMAIN_EXAMPLE)"; read site
    if [ $site ]
    then
        sudo certbot --nginx -d $site <<<$(printf "$P_MAIL\nA\n2\n2\n")
        # sudo certbot renew --dry-run
    else
        print_fn Red "SKIP!!!"
    fi
}
