#!/bin/bash

sudo apt update

# Install Docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Install Minikube
if ! command -v minikube
then
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
	echo "Minikube already installed"
fi

# Install kubectl
sudo snap install -y kubectl --classic

# Install net-tools
sudo apt install -y net-tools

# Clean up downloaded Minikube package
rm minikube_linux_amd64

# Install lang
sudo apt install -y golang clang llvm gcc-multilib libbpf-dev

# Install required tools
sudo apt install -y make

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
