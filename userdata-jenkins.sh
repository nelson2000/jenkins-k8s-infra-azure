#!/bin/bash
# install jenkinssudo systemct 
#!/bin/bash

sudo apt update -y
sudo apt install openjdk-11-jre -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

# # kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# # helm
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh


# docker
sudo apt-get update 
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER 
sudo chmod 777 /var/run/docker.sock



# #####################
# # install azure cli #
# #####################

# sudo apt-get update
# sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
# sudo mkdir -p /etc/apt/keyrings
# curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
#     gpg --dearmor |
#     sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
# sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# AZ_REPO=$(lsb_release -cs)
# echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
# sudo tee /etc/apt/sources.list.d/azure-cli.list

# sudo apt-get update
# sudo apt-get install azure-cli -y


# # kustomize

# wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.5.7/kustomize_v4.5.7_linux_amd64.tar.gz

# tar -xf kustomize_v4.5.7_linux_amd64.tar.gz

# sudo cp kustomize /usr/local/bin


# sudo apt-get install software-properties-common -y
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt-get update -y
# sudo apt-get install python3.8 -y
# sudo apt install ansible -y

# # terraform

# sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
# wget -O- https://apt.releases.hashicorp.com/gpg | \
# gpg --dearmor | \
# sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# gpg --no-default-keyring \
# --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
# --fingerprint
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
# https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
# sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update -y
# sudo apt-get install terraform -y

# # sudo su - $USER

