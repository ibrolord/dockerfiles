#Git Lab Runner
apt update && apt upgrade -y ;
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
 
