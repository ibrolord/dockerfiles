#Git Lab Runner
sudo apt update && apt upgrade -y ;
: <<'longcomm'
sudo apt-get remove docker docker-engine docker.io ;
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common ;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ;
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" ;
sudo apt-get update &&  sudo apt-get install docker-ce
longcomm

sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-386 ;
sudo chmod +x /usr/local/bin/gitlab-runner ;
curl -sSL https://get.docker.com/ | sh ;
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash ;
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner sudo gitlab-runner start ;
ps aux | grep gitlab-runner ; 
gitlab-runner register #from gitlab project settings -> runners -> expand ;
sleep 5 ;
usermod -aG docker gitlab-runner ;
#sed '/^root    ALL=(ALL:ALL) ALL.*/a gitlab-runner ALL=(ALL) NOPASSWD: ALL ' /etc/sudoers
sed -i '/^root.*/a gitlab-runner ALL=(ALL) NOPASSWD: ALL ' /etc/sudoers ;
sudo gitlab-runner restart
