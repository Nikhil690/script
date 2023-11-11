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

if ! command -v docker compose && ! command -v docker-compose &> /dev/null
then

while true; do
    echo "Do you want to install Docker Compose plugin(p) / Docker compose standalone(s) or don't want it? (p/s/anykey)"
    read answer

    case "$answer" in
        p)  if ! command docker compose &> /dev/null
            then
             # Install Docker Compose
             DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
             mkdir -p $DOCKER_CONFIG/cli-plugins
             curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
            
             chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
            else
             echo "Docker compose plugin is already installed"
            fi

            break
            ;;
        s) if ! command docker-compose &> /dev/null
           then
                sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
                sudo chmod +x /usr/local/bin/docker-compose
           else
                echo "Docker compose standalone is already installed"
           fi

            break
            ;;

        *)
            echo "Skipping Docker Compose installation."
            break
            ;;
    esac
done

else
    echo "docker compose is ready"
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
if ! command -v kubectl
then
    sudo snap install kubectl --classic
else
    echo "Kubernetes is already installed"
fi

# Install net-tools
if ! command -v ifconfig &> /dev/null
then    
    sudo apt install -y net-tools
else
    echo "net-tools already installed"
fi

# Install lang
sudo apt install -y golang clang llvm gcc-multilib libbpf-dev

# Install required tools
sudo apt install -y make

# Install bpftool
sudo apt install  -y linux-tools-5.15.0-84-generic

echo "Installation completed successfully."

#zsh installation

while true; do
    echo "Do you want to continue zsh installation? (y/n)"
    read answer

    case "$answer" in
        y)
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
        n)
            echo "Aborted"
            break  # Exit the loop
            ;;
        *)
            echo "Are you dumb! enter 'yes' or 'no'."
            ;;
    esac
done
