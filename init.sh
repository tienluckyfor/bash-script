
mkdir -p /var/www; 
cd /var/www; 
git clone https://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@github.com/tienluckyfor/bash-script.git; 
cd bash-script; 
source .env;
bash scripts/init_lemp.sh;