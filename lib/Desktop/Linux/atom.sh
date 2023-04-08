atom(){
	wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
	sudo apt-get update;
	install atom;

	while true; do
    read -p "Do you wish to open this program? (Y/N) " c
    case $c in
        [Yy]* ) Atom; ready; sleep 5; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
	done

	echo ""
}
