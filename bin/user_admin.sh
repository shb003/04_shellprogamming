#!/bin/bash

passwd=/etc/passwd

echo "(check on user)"
echo "-----------------------------"
echo "1  user add    "
echo "2  user verify    "
echo "3  user delete    "
echo "4  break    "
echo "-----------------------------"


useradd(){

}

userverify() {
    echo "-------------------------------------------------------------"
    echo "$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' $passwd | cat -n)"
    echo "-------------------------------------------------------------"
  }



userdel(){

}




while true
do
    Nenu
    echo -n "choice num! (1|2|3|4): "
    read num

    case $num in
        1) useradd ;;
        2) userverify ;;
        3) userdel ;;
        4) break ;;
        *) echo "error! re try plz!" ; exit 1
    esac
done