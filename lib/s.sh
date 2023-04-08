. profile/fetch.sh

echo ""
echo "Which platform you like to select?"
echo ""
echo "   1) Linux"
echo "   2) Exit"
echo ""
while [[ $OPTION != "1" && $OPTION != "2" ]]; do
	read -rp "Select an option [1-2]: " OPTION
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
    else
        echo -e ${Red}"Your system is unsupported"
        exit
    fi

    output(){

		echo ""
    for file in $(ls ./lib/Server/Linux)
    do
      if [ $file != fetch.sh ]
      then
          basename $file .sh
      fi

    done;
		echo ""
    echo "=========================="
    echo "Input file name: " && read program

    case $program in

        $program) $program; clear;
        ready;;
        *) output
				;;

    esac
    }

    output
    ;;
  *)
    exit
    ;;
esac
