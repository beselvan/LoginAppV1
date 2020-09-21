#------------------------------------------------------------------------------------------
# Linux
yum update -y
yum upgrade -y
yum install -y git zip unzip tar net-tools ntsysv java-1.8.0-openjdk.x86_64 maven wget curl
#------------------------------------------------------------------------------------------
# Docker 

sudo yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum install docker-ce docker-ce-cli -y
service docker start
systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod 755 /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#------------------------------------------------------------------------------------------
# Jenkins

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

yum install -y jenkins
usermod -aG docker jenkins
systemctl start jenkins
systemctl enable jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword

#------------------------------------------------------------------------------------------
# Application


git clone https://github.com/beselvan/LoginApp.git
mvn -f ~/LoginApp/pom.xml package
docker-compose -f ~/LoginApp/docker-compose.yml  up -d

#------------------------------------------------------------------------------------------
# Kubernetes

cat >> /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubeadm kubelet kubectl


#------------------------------------------------------------------------------------------


