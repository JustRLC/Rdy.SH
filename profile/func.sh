function isInstalled() {

    if [ ! dpkg -s $1 > /dev/null 2>&1 ]; then
        return 0
    else
        return 1
    fi
}
function install() {
    if isInstalled $1 ; then
        echo -e ${Blue}"[INFO] $1 was already installed."${Treset}
        return 1
    fi

    echo -e ${Yellow}"[INFO] Installing $1..."${Treset}

    if [ $OS == 'debian' ] || [ $OS == 'ubuntu' ]; then
        sudo apt-get install $1 -y -qq > /dev/null
    elif [ $OS == 'macos' ]; then
        brew install $1 > /dev/null
    elif [ $OS == 'macos' ]; then
        brew cask install $1 > /dev/null

    fi

    if isInstalled $1 ; then
        echo -e ${Green}"[SUCCESS] $1 has been installed."${Treset}
        return 1
    else
        echo -e ${Red}"[FATAL] The installation of $1 failed. Aborting..."${Treset}
        exit
    fi
}

function brewCheck() {
  which -s brew
  if [[ $? != 0 ]] ; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
      brew update
  fi
}
