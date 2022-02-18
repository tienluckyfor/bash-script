Deploy Backend
--
# 1. Mua VPS
# 2. Setup bash-script
# 3. DNS domain
# 4. Setup project


# 1. Mua VPS
ssh root@157.245.206.136

# 2. Setup bash-script
source <(curl -s https://raw.githubusercontent.com/tienluckyfor/bash-script/main/init.sh)

# 4. Setup project
cd /var/www;
git clone https://github.com/PPEProjects/it-be.git
npm install
npm run create-only-db


# 3. Models
# 4. Routes API => json
# 5. Controller (Restful, Postman)
# 6. Routes Views => giao diện người dùng
# 7. Fix (cURL error)
# 8. Views list
# 9. Views delete
# 10. Views add

