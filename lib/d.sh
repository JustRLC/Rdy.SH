. profile/fetch.sh

echo ""
echo "Which platform you like to select?"
echo ""
echo "   1) Linux"
echo "   2) MacOS"
echo "   3) Exit"
echo ""
while [[ $OPTION != "1" && $OPTION != "2" && $OPTION != "3" ]]; do
	read -rp "Select an option [1-3]: " OPTION
done

case $OPTION in

  1)
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        OS=Debian
        VER=$(cat /etc/debian_version)
		elif type sw_vers >/dev/null 2>&1; then
				OS=$(sw_vers -productName)
				VER=$(sw_vers -productVersion)
    else
        echo -e ${Red}"Your system is unsupported"
        exit
    fi

		echo ""

	  function lsLinux (){
			clear
			echo ""
			echo "======="
	    for file in $(ls lib/Desktop/Linux)
	    do
	      if [ $file != fetch.sh ]
	      then
	          basename $file .sh
	      fi
	    done;
			echo "======="
		}

		lsLinux

		while true; do
			echo "Type 'e' to stop script"
	    read -p "Input file name:  " app
	    case $app in
					[Ee] ) clear; exit;;
	        $app) $app; lsLinux;;
	    esac
		done
    ;;
  2)
    if type sw_vers >/dev/null 2>&1; then
				OS=$(sw_vers -productName)
				VER=$(sw_vers -productVersion)
    else
        echo -e ${Red}"Your system is unsupported"
        exit
    fi

		echo ""

	  function lsMacOS (){
			clear
			echo ""
			echo "======="
	    for file in $(ls lib/Desktop/MacOS)
	    do
	      if [ $file != fetch.sh ]
	      then
	          basename $file .sh
	      fi
	    done;
			echo "======="
		}

		lsMacOS

		while true; do
			echo "Type 'e' to stop script"
	    read -p "Input file name:  " app
	    case $app in
					[Ee] ) clear; exit;;
	        $app) $app; lsMacOS;;
	    esac
		done
    ;;
  *)
    exit
    ;;
esac
