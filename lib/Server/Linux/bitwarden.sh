bitwarden(){
  clear
  while true; do
    echo "Be sure to acquire ID & Key over at https://bitwarden.com/host/ "
    read -p "When you have acquired the information, type 'Y' to proceed: " c
    case $c in
        [Yy]* ) echo "Proceeding to the next steps... ";;
        * ) echo "Please answer 'y' to proceed: ";;
    esac
	done

  echo "Checking if Docker is installed"
  echo "--------------------------------"
  if [[ $(which docker) && $(docker --version) ]]; then
    echo "Docker is installed, preparing Bitwarden installation..."
  else
    echo "Installing docker..."
    bash lib/Desktop/Linux/docker.sh
  fi

  curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh
  sudo chmod +x bitwarden.sh

  ./bitwarden.sh install

}
