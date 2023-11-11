# https://raw.githubusercontent.com/Nikhil690/script/main/go.sh

#!/bin/bash

sudo apt update

# Install Docker
if ! command -v docker &> /dev/null
then
    sudo apt install -y docker.io
    sudo usermod -aG docker $USER
    sudo chmod 666 /var/run/docker.sock
    
else
    echo "Docker is already installed"
fi

# Install Minikube
if ! command -v minikube &> /dev/null
then
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
	echo "Minikube already installed"
    # Clean up downloaded Minikube package
    rm -rf minikube*
fi

# Install kubectl
if ! command -v kubectl &> /dev/null
then
    sudo snap install -y kubectl --classic
else
    echo "Kubernetes is already installed"
fi

# Install net-tools
if ! command -v ifconfig &> dev/null
then    
    sudo apt install -y net-tools
else
    echo "net-tools already installed"


# Install lang
sudo apt install -y golang clang llvm gcc-multilib libbpf-dev

# Install required tools
sudo apt install -y make

# Install bpftool
sudo apt install linux-tools-5.15.0-84-generic

echo "Installation completed successfully."cho "Installation completed successfully."

#zsh installation

while true; do
    echo "Do you want to continue zsh installation? (yes/no)"
    read answer

    case "$answer" in
        yes)
            sudo apt install -y zsh
            sudo apt install -y curl wget git
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

            echo "Installing Zsh"
            echo '' > ~/.zshrc
            echo "ZSH_THEME=\"avit\"" >> ~/.zshrc
            echo "DEFAULT_USER=$USER" >> ~/.zshrc
            echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" >> ~/.zshrc
            echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc

            sudo apt install command-not-found -y

            cd ~/.oh-my-zsh/plugins/
            sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
            sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

            source ~/.zshrc
            exec zsh
            cd
            break  # Exit the loop
            ;;
        no)
            echo "Aborted"
            break  # Exit the loop
            ;;
        *)
            echo "Are you dumb! enter 'yes' or 'no'."
            ;;
    esac
done
