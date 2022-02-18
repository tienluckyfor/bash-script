Deploy Backend
--
# 1. Setup bash-script
# 2. Setup project
# 3. DNS domain


# 1. Setup bash-script
ssh root@157.245.206.136
source <(curl -s https://raw.githubusercontent.com/tienluckyfor/bash-script/main/init.sh)

# 2. Setup project
cd /var/www;
git clone https://github.com/PPEProjects/it-be.git
cd it-be;
npm install;
- ppe > create database
npx prisma db push --preview-feature;
npm run pg-usercore;
npm run dev;

# 3. DNS domain
