discord(){
  sudo apt update
  sudo apt install gdebi-core wget
  wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo gdebi ~/discord.deb

  while true; do
    read -p "Do you wish to open this program? (Y/N) " c
    case $c in
        [Yy]* ) Discord; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no: ";;
    esac
	done
}
