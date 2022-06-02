#!/usr/bin/env bash
# Ubuntu 16.04 LTS (xenial)
# ~
# Configuration for users are from Github
#
logfile=phpstack_install.log

locale-gen en_US.UTF-8 # Some default locale is set to ASCII
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export DEBIAN_FRONTEND=noninteractive

# Authorization workflow (Github accounts)
usr=( )
adm=( "rmrhz" )

usrgrp=prjkt

# Script should be ran as root
if [ ! "$(whoami)" = 'root' ];
then
    echo "Script must be ran as root"
    exit;
fi;


# These packages are pre-installed in AWS
declare -A packages
packages["add-apt-repository"]="software-properties-common"
packages["ssh-keygen"]="ssh"
packages["curl"]="curl"
packages["vim"]="vim"
packages["git"]="git"

echo "[INFO] Installing missing dependencies"
{
# Check if the following packages are installed
for i in "${!packages[@]}"
do
    if [ "$(which ${packages[$i]})" = "" ];
    then
        apt install -y ${packages[$i]};
    fi;
done
} >> $logfile

# Install Nginx
echo "[INFO] Installing Nginx..."
sleep 2
{
    if [ "$(which nginx)" = "" ];
    then
        apt -y install nginx
    fi;

} >> $logfile

# Install Redis
echo "[INFO] Installing Redis"
sleep 2
{
    if [ "$(which redis-server)" = "" ];
    then
        apt install redis-server
    fi;
} >> $logfile

# Install Certbot Auto
echo "[INFO] Installing LetsEncrypt"
sleep 2
{
    if [ "$(which certbot)" = "" ];
    then
        apt -y install python-certbot-nginx
    fi;
} >> $logfile

# Install mariadb
echo "[INFO] Installing MariaDB..."
sleep 2
{
    if [ "$(which mysql)" = "" ];
    then
        apt -y install mariadb-client
    fi;
} >> $logfile

# Install PHP Stack
echo "[INFO] Installing PHP & components..."
sleep 2
{

    if [ "$(which php)" = "" ];
    then
        apt -y install php php-common php-ssh2 php7.2-cli php7.2-fpm php7.2-mysql php7.2-gd php7.2-curl php7.2-mbstring php7.2-xml php7.2-zip php7.2-bcmath
    fi;

    if [ "$(which composer)" = "" ];
    then
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        php composer-setup.php
        mv composer.phar /usr/bin/composer && php -r "unlink('composer-setup.php');"
    fi;

} >> $logfile

echo "[INFO] Installing NodeJS & components..."
sleep 2
{
    if [ "$(which node)" = "" ];
    then
        curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
        apt -y install nodejs
    fi;
} >> $logfile

# Start authorization workflow
echo "[INFO] Provisioning necessary authorization..."
sleep 2
{
    groupadd $usrgrp
    adduser --home /home/project --system --ingroup $usrgrp --shell /bin/bash --disabled-password project
    adduser --home /home/admin --system --ingroup $usrgrp --shell /bin/bash --disabled-password admin

    cd /home/project
    mkdir .ssh
    cd .ssh
    ssh-keygen -q -N "" -t rsa -b 4096 -C rmrhz@nonein.site -f project
    mv project id_rsa && mv project.pub id_rsa.pub


    # Checks if the github profile exists

    for i in "${!usr[@]}"
    do
        if [ "$(curl -sL -w "%{http_code}\\n" "https://github.com/${usr[$i]}" -o /dev/null)" = "200" ];
        then
            curl "https://github.com/${usr[$i]}.keys" >> authorized_keys
            sed -i -e '$a\' authorized_keys
        fi;
    done

    chmod 644 authorized_keys
    chown project:$usrgrp id_rsa id_rsa.pub
    cd ../
    mkdir www conf log run ssh
    chown project:$usrgrp www conf log run ssh

    cd /home/admin
    mkdir .ssh
    cd .ssh
    ssh-keygen -q -N "" -t rsa -b 4096 -C rmrhz@nonein.site -f admin
    mv admin id_rsa && mv admin.pub id_rsa.pub

    # Checks if the github profile exists
    for i in "${!adm[@]}"
    do
        if [ "$(curl -sL -w "%{http_code}\\n" "https://github.com/${adm[$i]}" -o /dev/null)" = "200" ];
        then
            curl "https://github.com/${adm[$i]}.keys" >> authorized_keys
            sed -i -e '$a\' authorized_keys
        fi;
    done

    chmod 644 authorized_keys
    echo "admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/admin

} >> $logfile
