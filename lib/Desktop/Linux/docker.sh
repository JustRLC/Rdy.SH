docker(){
	sudo apt-get remove docker docker-engine docker.io containerd runc
	sudo apt-get update;
	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common;
	curl -fsSL https://download.docker.com/linux/$(OS | tr '[:upper:]' '[:lower:]')/gpg | sudo apt-key add -;
	sudo apt-key fingerprint 0EBFCD88;
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -si | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable";
	sudo apt-get update;
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y
	sudo groupadd docker;
	sudo usermod -aG docker $USER;
}
