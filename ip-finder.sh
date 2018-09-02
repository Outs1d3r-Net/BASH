#!/bin/bash

clear
if [ "$*" != "-s" -a "$*" != "--start" ]; then
    echo "'._____________    _____.__            .___                    ____    _______ '" 
    echo "'|   \______   \ _/ ____\__| ____    __| _/___________  ___  _/_   |   \   _  \'"
    echo "'|   ||     ___/ \   __\|  |/    \  / __ |/ __ \_  __ \ \  \/ /|   |   /  /_\  \'"
    echo "'|   ||    |      |  |  |  |   |  \/ /_/ \  ___/|  | \/  \   / |   |   \  \_/   \'"
    echo "'|___||____|      |__|  |__|___|  /\____ |\___  >__|      \_/  |___| /\ \_____  /'"
    echo "__________________________________________________________________________________"
    echo -e "\n\n"
    echo "'     \_______/'"
    echo "' -.,-'\_____/--.,''                User: '$0 --start' "
    echo "'  /-..'\ _ /-.,'\'                            -s  start for ip finder"
    echo "' /  /-.,' -.,'\  \'"
    echo "'/__/__/     \__\__\__'"
    echo "'\  \  \     /  /  /'"
    echo "' \  \,'-._,'-./  /'"
    echo "'  \,'-./___\,'-./'                               By: Init-0 "
    echo "' ,'--./_____\,-'-.'"
    echo "'     /       \'"
    echo
    exit;
fi
if [ "$*" == "-s" -o "$*" == "--start" ]; then
    echo "'._____________    _____.__            .___                    ____    _______ '" 
    echo "'|   \______   \ _/ ____\__| ____    __| _/___________  ___  _/_   |   \   _  \'"
    echo "'|   ||     ___/ \   __\|  |/    \  / __ |/ __ \_  __ \ \  \/ /|   |   /  /_\  \'"
    echo "'|   ||    |      |  |  |  |   |  \/ /_/ \  ___/|  | \/  \   / |   |   \  \_/   \'"
    echo "'|___||____|      |__|  |__|___|  /\____ |\___  >__|      \_/  |___| /\ \_____  /'"
    echo "__________________________________________________________________________________"
    echo -e "\n\n"
    echo "         1           1"
    echo "        1 0 1100011 0 1                Welcome the IP FINDER "
    echo "       1  11   &   11  1                Please set the ip target:"
    echo "     10  1  @~   ~@  1  01"
    echo " 1011   1 0  @~ ~@  0 1   1011"
    echo "       0   1  @@@  1   1"
    echo "      1    1.#####.1    1"
    echo "   101        #w#        101                               By: Init-0 "
    echo -e "\n"                                       
    read -p "IP:----->> " IptargeT
fi
Bsearch="https://www.geoiptool.com/en/?ip="
GET $Bsearch$IptargeT > gGeoIpTooLl.txt 
clear
echo "Waiting tracking the target..."
sleep 3
clear
IPaddress="$(cat gGeoIpTooLl.txt | grep "IP Address" | tail -n1 | cut -d">" -f2 | cut -d"<" -f1)"
HOstname="$(echo "Hostname: "`cat gGeoIpTooLl.txt | grep td | tail -n1 | cut -d">" -f2 | cut -d"<" -f1`)"
COuntry="$(cat gGeoIpTooLl.txt | grep "Country" | tail -n1 | cut -d">" -f2 | cut -d"<" -f1)"
COuntryCODe="$(echo "Code: "`cat gGeoIpTooLl.txt | grep "span" | grep ")" | cut -d">" -f2 | cut -d"<" -f1 | tr "\n" "+" | cut -d"+" -f1`)"
RregionN="$(echo "Region: "`cat gGeoIpTooLl.txt | grep "span" | grep Region -A 1 | tac | cut -d">" -f2 | cut -d"<" -f1 | tr "\n" "+" | cut -d"+" -f 1`)"
CIty="$(cat gGeoIpTooLl.txt | grep "City" | tail -n1 | cut -d">" -f2 | cut -d"<" -f1)"
LAtitude="$(echo "Latitude: "`cat gGeoIpTooLl.txt | grep "lat" | grep ":" | tail -n1 | tr -d "{}" | cut -d" " -f2 | tr -d ","`)"
LOngitude="$(echo "Longitude: "`cat gGeoIpTooLl.txt | grep "lat" | grep ":" | tail -n1 | tr -d "{}" | cut -d" " -f4 | tr -d ","`)"
echo "             0"
echo "             0"
echo "             1"
echo "             0"
echo "             0"
echo "        1    1    1"
echo "       0 1   1   1 0          $HOstname"
echo "      1   0010110   1         $IPaddress"
echo "     1   1101&1011   1        $COuntry"
echo " 1010 1  101010111  1 1001    $COuntryCODe"
echo "     1 1 1@~101~@1 1 1        $RregionN"
echo "  101   1 1@~~~@1 1   110     $CIty"
echo "      1111 1@@@1 1101         $LAtitude"
echo "     1  1   0w0   0  1        $LOngitude"
echo "   01  0    1 1    1  01"
echo "        1         1"
echo "         1       1                                         By: Init-0 "
echo
rm -rf gGeoIpTooLl.txt
exit;
