# setup
```
mkdir -p /var/www; cd /var/www; git clone https://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@github.com/PPEProjects/bash-script.git; cd bash-script; git config --global credential.helper store; git pull; source .env; bash scripts/init_lemp.sh;
```

# alias
vi ~/.bash_aliases
```
echo 'P_PATH="/var/www/bash-script"; alias ppe="source $P_PATH/.env; bash $P_PATH/menu.sh"' > ~/.bash_aliases; source ~/.bash_aliases;

echo 'P_PATH="/var/www/bash-script"; alias ppe_debug="source $P_PATH/.env; bash -x $P_PATH/menu.sh"' > ~/.bash_aliases; source ~/.bash_aliases;
```
# puppeteer
```
ssh root@157.230.42.58
cd /var/www/mockapi/apiCodeby-express/; git pull
cd /var/www/mockapi/apiCodeby-express/node_modules/puppeteer/.local-chromium/linux-901912/chrome-linux

ldd chrome | grep not

sudo apt-get install libatk1.0-0 libatk-bridge2.0-0 libxkbcommon-x11-0 libxdamage1 libpango-1.0-0 libcairo2 libatspi2.0-0 libnss3 libnspr4 libgbm1

libatk-bridge-2.0.so.0 => not found
libxkbcommon.so.0 => not found
libXdamage.so.1 => not found
libgbm.so.1 => not found
libpango-1.0.so.0 => not found
libcairo.so.2 => not found
libatspi.so.0 => not found
```