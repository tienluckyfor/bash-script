#!/bin/bash
source "${P_BASHSCRIPT_PATH}/common/fn.sh"
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------

EDITOR=vim
PASSWD=/etc/passwd
# RED='\033[0;41;30m'
# STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

# one(){
# 	echo "one() called"
#         pause
# }
 
# # do something in two()
# two(){
# 	echo "two() called"
#         pause
# }
 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " ${P_MENU^^} - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	print_fn Yellow "Init"
	echo " - 01. Init LEMP (Linux, Nginx, Mariadb, PHP)"
	echo " - 02. Init MERN (Mongo, Express, React, Nodejs)"
	print_fn Yellow "Domains"
	echo " - 10. Add Expressjs"
	# echo " - 101. Add Expressjs part"
	echo " - 11. Add Reactjs"
	echo " - 12. Add Laravel"
	echo " - 13. Add Wordpress"
	echo " - 14. Add SSL"
	print_fn Yellow "Databases"
	echo " - 21. Add database"
	echo " - 22. Import database URL"
	echo " - 23. Import database local"
	echo " - 24. Export database"
	print_fn Yellow "Other"
	echo " - 31. Export folder"
	echo " - 32. Create swap"
	echo " - 321. Flush swap"
	echo " - 33. Setup phpMyadmin"
	echo "0. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.

source "${P_BASHSCRIPT_PATH}/scripts/init_lemp.sh"
source "${P_BASHSCRIPT_PATH}/scripts/init_mern.sh"
source "${P_BASHSCRIPT_PATH}/scripts/nginx.sh"
source "${P_BASHSCRIPT_PATH}/scripts/ssl.sh"
source "${P_BASHSCRIPT_PATH}/scripts/database.sh"
source "${P_BASHSCRIPT_PATH}/scripts/backup.sh"
source "${P_BASHSCRIPT_PATH}/scripts/swap.sh"
source "${P_BASHSCRIPT_PATH}/scripts/flushSwap.sh"
source "${P_BASHSCRIPT_PATH}/scripts/phpMyadmin.sh"

read_options(){
	local choice
	read -p "Enter choice: " choice
	case $choice in
		01) init_lemp ;;
		02) init_mern ;;
		10) expressjs_nginx ;;
		# 101) expressjs_nginx_part ;;
		11) reactjs_nginx ;;
		12) laravel_nginx ;;
		13) wordpress_nginx ;;
		14) ssl ;;
		21) add_db ;;
		22) import_db_local ;;
		23) import_db_url ;;
		24) export_db ;;
		31) export_folder ;;
		32) create_swap ;;
		321) flush_swap ;;
		33) setup_phpmyadmin ;;
		0) exit 0;;
		*) print_fn Red "Error..." && sleep 2
		# *) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------

while true
do
	show_menus
	read_options
done

shopt -s expand_aliases
alias $P_MENU='bash menu.sh'
