http://159.223.87.219:6001
ssh root@159.223.87.219
pm2 start /var/www/bash-script/configs/pwsServer/pws_start.sh
pm2 restart pws_start
pm2 status


mysql -u "testuser" -p"vantien123" --database pusher_db < /var/www/bash-script/configs/pwsServer/pusher_db.sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

