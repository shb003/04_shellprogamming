-------¿¿¿¿¿ ¿¿¿¿ ¿¿----------


**********************************
---------¿¿ ¿ ¿¿¿¿¿-----------
**********************************

1) ¿¿ ¿¿

2) ¿¿¿
	grep CMD
		# grep OPTIONS PARRERNS file1
		OPTIONS: -i, -v ,-l , -n, -r, -w
		PARRERNS: * . ^root root$ [abc] ....
	sed CMD
		p cmd) # sed -n '1,3p' /etc/host
		d cmd) # sed ;'1,3d' /etc/host
		s cmd) # sed -i '/main/s/192.168.10.10/192.168.10.20/' /etc/host
		
	awk CMD
		# awk 'statement {action}' ¿¿¿¿
		# awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd
		# df -h / | tail -1 | awk '{print $6}' | awk -F% '{print $1}'
		# ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F: '{print $2}'
		# ps -elf | awk '$2 == "Z" {print $0}'	
	+
	CMD(cut cmd ...)
	¿¿(sort)
	¿¿ - ¿¿¿¿¿ ¿¿¿¿ ¿¿
		# sort -u file1  
	¿¿ - ¿¿¿¿ ¿¿ ¿¿
		# sort file1 | uniq -d 
	¿¿ - ¿¿¿ ¿¿¿¿ ¿¿
		# sort file1 | uniq -u
		
	cut ¿¿¿ - ¿¿¿ ¿¿¿¿ ¿¿¿ ¿¿ ¿¿
		# cut -c1-5 /etc/hosts - ¿¿ ¿ ¿¿ ¿ 1~5¿¿¿ ¿¿
		# cat /etc/hosts | tr '[a-z]' '[A-Z]'
			¿ ¿¿¿¿ ¿¿¿¿ ¿¿¿ ¿¿
		# cat /etc/hosts | egrep -v '(^$|^#)' | cut -f 1 
		# cut -d ":" -f 1 /etc/passwd 		(# awk -F: '{print $1}' /etc/passwd)
		# ifconfig eth0 | grep 'inet addr:' | awk '{print $2}' | cut -d":" -f2 
		
	paste ¿¿¿ - ¿¿¿ ¿¿¿ ¿¿¿ ¿¿ ¿¿¿ ¿¿¿¿ ¿¿
		# paste file1 file2  
		
	wc ¿¿¿
		# wc /etc/passwd

3) ¿¿ ¿¿
	¿ ¿¿¿¿¿(Redirection) 		: <  <<  >  >>  2>  2>>
		# cat < /etc/passwd - ¿¿¿ ¿¿
		# cat > file1 - ¿¿¿ ¿¿¿ ¿¿ ¿¿¿¿ ¿¿ (¿¿¿ ctl+d)
		
	¿ ¿¿¿(pipe)            		: |
		¿¿¿ ¿¿¿ ¿¿
		# CMD | more
		# CMD | grep rsyslogd
		# CMD | CMD
	¿ ¿ ¿¿¿ ¿¿(bash function)  	: set -o vi
	¿ ¿¿(Variable)                 	: export VAR=5
		¿¿¿ ¿¿
		- ¿¿¿¿(# VAR=5)
		- ¿¿¿¿(# export VAR=5)
		- ¿¿¿¿($$, $?, $!, $*, $1, $2, ....)
		
		¿¿ ¿¿ ¿¿(env/set)
		(¿¿) # VAR=5     (# export VAR=hello)
			 # export VAR 
		(¿¿) # echo $VAR (# printf $VAR)
			
		$$ : ¿¿ ¿¿ PID ¿¿ ¿¿(EX: ¿¿ ¿¿ ¿¿, /tmp/.tmp.$$)
		$! : ¿¿ ¿¿ ¿¿¿ ¿¿¿¿¿ ¿¿¿¿¿ PID ¿¿ ¿¿
		$? : ¿¿ ¿¿ ¿¿¿ ¿¿¿¿ return value ¿¿(0 ~ 255)
		$* : ¿¿ ¿¿($* == $@)
		$# : ¿¿¿ ¿¿
		$0 : ¿¿¿¿ ¿¿
		$1 : ¿¿¿¿¿ ¿¿ ¿¿¿ ¿¿
		$2 : ¿¿¿¿¿ ¿¿ ¿¿¿ ¿¿
		$3 : ¿¿¿¿¿ ¿¿ ¿¿¿ ¿¿
			(¿¿) # unset VAR 
	¿ ¿¿ - alias¿ ¿¿ ¿¿¿¿ ¿¿¿ ¿¿ ¿¿¿!
	(¿¿) # a() { ls; date; cal; }   or   function a { ls; date; cal; }
	(¿¿) # a 
	(¿¿) # typeset -f 
	(¿¿) # unset -f a 
	[¿¿] CMD -> alias -> function -> script
	¿ ¿¿¿(Grouping) 
		( ls ; pwd ; date ) > outputfile 
	¿ ¿¿ ¿¿¿ ( && , || )
	¿ ¿¿¿¿¿(Metacharacter)		: ''  ""  ``  ;
	¿ ¿¿¿¿(History)				: history	
	¿ ¿¿¿¿(Environment Files)		: /etc/profile, ~/.bash_profile, ~/.bashrc

5) ¿ ¿¿¿¿ ¿¿

	1. ¿¿¿¿ ¿¿¿ ¿¿
		# bash -x script.sh
		# . ~/.bashrc
		# vi script.sh ' chmod +x script.sh ; ./script.sh
		
	2. ¿¿¿¿
		* ¿¿ ¿¿ - #
		* ¿¿ ¿ ¿¿ - : << EOF ~ EOF
	3. ¿¿¿ ¿¿
		¿¿ : echo CMD, printf CMD
		¿¿ : read CMD
		
#!/bin/bash

#svc.sh start sshd
# -> systemctl enable sshd
# -> systemctl restart sshd
# -> systemctl status sshd

#svc.sh stop sshd
# -> systemctl disable sshd
# -> systemctl stop sshd
# -> systemctl status sshd


-------------continue¿ ¿¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿----------------

#!/bin/bash

egrep -i '(warn|fail|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp1
¿ ¿¿¿ ¿¿¿ ¿¿¿ (30¿ ¿ ¿¿)

while true - ¿¿¿
do
    sleep 30 - 30¿ ¿¿
    egrep -i '(warn|fail|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp2
		¿ 30¿ ¿¿ ¿¿¿ ¿¿ ¿¿¿¿ tmp1 ¿ 2¿ ¿¿¿¿ ¿¿¿
	diff /tmp/.tmp1 /tmp/.tmp2 > /tmp/.tmp3 && continue
		¿ ¿¿¿¿ ¿¿¿ tmp ¿¿¿¿ ¿¿ ¿¿¿ ¿¿¿ continue!
    mailx -s "[WARN] Log Mail Check" root < /tmp/.tmp3
		¿ ¿¿¿¿ ¿¿ ¿¿¿ ¿¿¿¿ ¿¿¿¿¿ ¿¿¿ ¿¿¿ ¿ 
    egrep -i '(warn|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp1
		¿ ¿¿ ¿¿¿¿ ¿¿¿¿ ¿¿¿ tmp1¿ ¿¿
done

(¿¿)
¿¿: ¿¿ ¿¿¿ ¿¿¿¿ ¿¿ ¿¿¿¿ ¿¿
¿¿: 
¿ ¿¿ ¿¿¿ ¿¿¿ ¿¿¿ ¿¿
¿ ¿¿ ¿¿¿ ¿¿¿ ¿¿¿ ¿¿¿¿¿ ¿¿¿ ¿¿(To: root)
¿ ¿ ¿¿¿¿¿ ¿¿¿¿ ¿¿¿.(EX: Daemon)
¿ ¿¿¿¿ ¿¿¿: egrep -i '(warn|fail|err|crit|alert|emerg)' /var/log/messages
¿ 30¿¿ ¿¿¿ ¿¿ ¿¿¿ ¿¿¿ ¿¿¿ ¿¿¿ ¿¿¿¿.

* diff ¿¿¿ ¿¿: diff file1 file2 = ¿¿1¿ ¿¿2¿ ¿¿¿ ¿¿


---------------FTP ¿¿ ¿¿------------------------
#!/bin/bash
HELP(){
cat << EOF
Commands may be abbreviated.  Commands are:

!		debug		mdir		sendport	site
$		dir		mget		put		size
account		disconnect	mkdir		pwd		status
append		exit		mls		quit		struct
EOF
}

ERROR(){
    [ "$CMD" ] && echo "[WARN]Invalid command"
}

while true
do
    echo -n "ftp> "
    read CMD
    case $CMD in
        'quit'|'bye') break ;;
        'help') HELP ;;
        *) ERROR ;;
    esac
-------------------------------------------------

*) IO ¿¿¿¿¿ ¿¿ ¿¿¿¿
	for LINE in $(cat file1)
	do
		echo $LINE
	done > file2
	----¿¿2(¿¿)---
	cat file1 | while read LINE
	do
		echo $LINE
	done > file2

*) ¿¿¿ ¿¿
	*¿¿¿¿¿
	*¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿¿ ¿¿

*) ¿¿¿
	* bash -x script.sh
	* bash -xv script.sh
*) ¿¿ ¿¿
	getopts CMD + while CMD + case CMD
	(¿) # ssh.sh -p 80 192.168.10.20
	while getopts p: options
	do
		case $options in
			p ) P_ACTION ;;
			\?) Usage    ;;
			* ) Usage    ;;
		esac
	done


-----------¿¿ ¿¿ ¿¿--------------------
#!/bin/bash
#   # ./check_service.sh 192.168.10.10 192.168.10.20
#   ------------------
#   192.168.10.10
#   ------------------
#   svc1    active
#   svc2    active
#
#   ------------------
#   192.168.10.20
#   ------------------
#   svc3    active
#   svc4    active
#   ....

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <IP1> <IP2>"
    exit 1
fi
export FIRST_IP=$1
export SECOND_IP=$2
export BASEDIR=/root/bin

ServiceList() {
# input: str        # ServiceList main
# output: file      # ServiceList main -> main.txt
# functions:  
SERVER=$1   
ssh $SERVER systemctl -t service | sed -n '1,/^LOAD/p' \
                                 | sed '$d' \
                                 | awk '{print $1, $3}' > $BASEDIR/$SERVER.txt
}

ServiceList $FIRST_IP
ServiceList $SECOND_IP

FSERVER=$BASEDIR/$FIRST_IP.txt
SSERVER=$BASEDIR/$SECOND_IP.txt

cat << EOF
##############################
"$FIRST_IP"
##############################
$(diff $FSERVER $SSERVER | fgrep '<' | cut -c3-)

##############################
"$SECOND_IP"
##############################
$(diff $FSERVER $SSERVER | fgrep '>' | cut -c3-)

EOF

----vscode ¿¿¿¿ ¿¿¿¿ ¿¿------
* crontab + vskill.sh

kill $(ps -ef | grep -w code \
         | grep -v 'grep --color' \
         | awk '{print $2}' \
         | sort \
         | head -1)
---------------------------------

fdisk -l | grep LVM | awk '{print $1}' > pv1.txt
pvs | tail -n +2 | awk '{print $1}' > pv2.txt

ENV1.sh : ¿¿¿¿
	* $HOME/.bashrc
ENV2.sh : ¿¿¿ ¿¿¿ ¿¿
	* ¿¿¿ ¿¿ (gcc, php, vscode)
ENV3.sh : ¿¿ ¿¿
	¿¿ ¿¿ - telnet-server
	ftp ¿¿ - vsftpd ftp
	ssh ¿¿ - openssh-server openssh-clients openssh-clients
	nginx ¿ ¿¿ - yum -y install nginx
				  echo "Nginx webserver > /usr/share/nginx/html/index.html
				  systemctl enable --now nginx.server


