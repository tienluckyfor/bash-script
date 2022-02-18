#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"

init_pws_server(){
# node, pws
sudo apt update && sudo apt upgrade -y
apt install cmdtest -y
apt install npm -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install -g @soketi/pws
ppe <<<$(printf "\n21\npusher_db\n\n0\n")
mysql -u "$P_DB_USERNAME" -p"$P_DB_PASSWORD" --database pusher_db < $P_BASHSCRIPT_PATH/configs/pwsServer/pusher_db.sql

npm install pm2@latest -g
    
}