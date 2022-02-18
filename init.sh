rm -rf /var/www/bash-script;

mkdir -p /var/www; 
cd /var/www; 
git clone https://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@github.com/tienluckyfor/bash-script.git; 
cd bash-script; 
source .env;
source scripts/init_lemp.sh;

shopt -s expand_aliases
echo 'P_PATH="/var/www/bash-script"';
alias ppe="source $P_PATH/.env; bash $P_PATH/menu.sh"';
ppe

