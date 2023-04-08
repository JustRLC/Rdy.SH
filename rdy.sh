#!/bin/bash
. profile/fetch.sh

if [[ $EUID -ne 0 ]]; then
	echo -e "Sorry, you need to run this as root"
	exit 1
fi

clear

cat << "EOF"

██████╗ ██████╗ ██╗   ██╗███████╗██╗  ██╗
██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║  ██║
██████╔╝██║  ██║ ╚████╔╝ ███████╗███████║
██╔══██╗██║  ██║  ╚██╔╝  ╚════██║██╔══██║
██║  ██║██████╔╝   ██║██╗███████║██║  ██║
╚═╝  ╚═╝╚═════╝    ╚═╝╚═╝╚══════╝╚═╝  ╚═╝
https://github.com/justrlc/rdy.sh

EOF

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si | )
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=Debian
    VER=$(cat /etc/debian_version)
elif type sw_vers >/dev/null 2>&1; then
    OS=$(sw_vers -productName | awk '{print tolower($0)}')
		VER=$(sw_vers -productVersion)
else
		echo -e ${Red}"Your system is unsupported."
		exit
fi


echo ""
echo "Which system you like to select?"
echo ""
echo "   1) Desktop"
echo "   2) Server"
echo "   3) Exit"
echo ""
while [[ $OPTION != "1" && $OPTION != "2" && $OPTION != "3" ]]; do
	read -rp "Select an option [1-3]: " OPTION
done


case $OPTION in
	1)
		bash $d
	  ;;
	2)
	  bash $s
	  ;;
	*)
	  exit
		;;
esac
