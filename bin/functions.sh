#!/bin/bash


# VD
export PKG_DOWN_DIR=/root/bin
export vsftpd_vsftpusers=/etc/vsftpd
export vsftpd_userlist=/etc/vsftpd/user_list
export sshd_conf=/etc/ssh/sshd_config
# FD

    function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}


pkgInst() {
    #input pkg
    #output op string
    #functions
    PKGS=$*
    #echo $PKGS
    yum -qy install $PKGS >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ OK ] $PKGS installed. "
    else
        echo "[ FAIL ] $PKGS fail installed "
        exit 1
    fi
}

svcEnable() {
    SVC="$1"
    systemctl enable --now $SVC > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ok] $SVC unit start"
    else
        echo "[fail] $SVC fail to started "
        exit 1
        fi
}

vscodeInst() {
    rpm --import https://packages.microsoft.com/keys/microsoft.asc
    cat << EOF > /etc/yum.repos.d/vscode.repo
    [code]
    name=Visual Studio Code
    baseurl=https://packages.microsoft.com/yumrepos/vscode
    enabled=1
    gpgcheck=1
    gpgkey="https://packages.microsoft.com/keys/microsoft.asc" 
EOF
    pkgInst "code"
}

vscodeComment() {
    cat << EOF 
    #  root = # code --no-sandbox --user-data-dir=$HOME/workspace
    #  normal user = # code
EOF
}

chromeInst() {
    URL="wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    CHROME_PKG=$(basename $URL)

    wget $URL -O $PKG_DOWN_DIR/$CHROME_PKG >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo " [ ok ]"
    else
        echo " [ ch fail ]"
        exit 1
    fi
    
     yum -qy localinstall $PKG_DOWN_DIR/$CHROME_PKG >/dev/null 2>&1
     if [ $? -eq 0 ] ; then
        echo "[ OK ] Chrome download success"
    else
        echo "[ fail ]"
    fi
}

vsftpconf(){
    sed -i 's/^root/#root/' $vsftpd_ftpusers
    sed -i 's/^root/#root/' $vsftpd_userlist
    echo "[ OK ] success to configration of ftp"
}

sshconf(){
    sed -i 's/PermitRootLogin no/PermitRootLogin yes/' $sshd_conf
    sed -i 's/#PermitRootLogin/PermitRootLogin/' $sshd_conf

    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' $sshd_conf
    sed -i 's/#PasswordAuthentication no/PasswordAuthentication/' $sshd_conf
    echo "[ OK ] success to configration of ssh"
}
checkwebsvc(){
    # input: str(nginx|httpd)
    # output: str(httpd|nginx)
    # function:
    websvc=$1
    case $websvc in
    nginx) checkwebsvc=httpd ;;
    httpd) checkwebsvc=nginx ;;
    esac
    systemctl disable --now $checkwebsvc >/dev/null 2>&1
}

nginxconf(){
    echo "nginx webserver" > /usr/share/nginx/html/index.html
    echo "[ OK ] success to configration of nginx web server"
}