-------쉘스크립트 실습환경 구축----------


**********************************
---------배시 쉘 프로그래밍-----------
**********************************

1) 선수 지식

2) 명령어
	grep CMD
		# grep OPTIONS PARRERNS file1
		OPTIONS: -i, -v ,-l , -n, -r, -w
		PARRERNS: * . ^root root$ [abc] ....
	sed CMD
		p cmd) # sed -n '1,3p' /etc/host
		d cmd) # sed ;'1,3d' /etc/host
		s cmd) # sed -i '/main/s/192.168.10.10/192.168.10.20/' /etc/host
		
	awk CMD
		# awk 'statement {action}' 파일이름
		# awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd
		# df -h / | tail -1 | awk '{print $6}' | awk -F% '{print $1}'
		# ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F: '{print $2}'
		# ps -elf | awk '$2 == "Z" {print $0}'	
	+
	CMD(cut cmd ...)
	정열(sort)
	정열 - 중복된것을 하나로만 표시
		# sort -u file1  
	정열 - 중복되는 것만 표시
		# sort file1 | uniq -d 
	정열 - 중복되 않는것만 표시
		# sort file1 | uniq -u
		
	cut 명령어 - 필드를 잘라내는 역할로 많이 사용
		# cut -c1-5 /etc/hosts - 문서 각 줄의 앞 1~5자리만 표현
		# cat /etc/hosts | tr '[a-z]' '[A-Z]'
			ㄴ 소문자를 대문자로 바꿔서 출력
		# cat /etc/hosts | egrep -v '(^$|^#)' | cut -f 1 
		# cut -d ":" -f 1 /etc/passwd 		(# awk -F: '{print $1}' /etc/passwd)
		# ifconfig eth0 | grep 'inet addr:' | awk '{print $2}' | cut -d":" -f2 
		
	paste 명령어 - 다수의 파일을 한번에 볼때 옆으로 정렬해서 출력
		# paste file1 file2  
		
	wc 명령어
		# wc /etc/passwd

3) 쉘의 특성
	● 리다이렉션(Redirection) 		: <  <<  >  >>  2>  2>>
		# cat < /etc/passwd - 내용을 출력
		# cat > file1 - 파일의 내용을 직접 입력하여 생성 (마지막 ctl+d)
		
	● 파이프(pipe)            		: |
		파이프 명령어 형식
		# CMD | more
		# CMD | grep rsyslogd
		# CMD | CMD
	● 셀 자체의 기능(bash function)  	: set -o vi
	● 변수(Variable)                 	: export VAR=5
		변수의 종류
		- 지역변수(# VAR=5)
		- 환경변수(# export VAR=5)
		- 특수변수($$, $?, $!, $*, $1, $2, ....)
		
		변수 선언 방법(env/set)
		(선언) # VAR=5     (# export VAR=hello)
			 # export VAR 
		(확인) # echo $VAR (# printf $VAR)
			
		$$ : 현재 쉘의 PID 번호 저장(EX: 임시 파일 생성, /tmp/.tmp.$$)
		$! : 바로 이전 수행된 백그라운드 프로세스의 PID 번호 저장
		$? : 바로 이전 수행된 명령어의 return value 저장(0 ~ 255)
		$* : 모든 인자($* == $@)
		$# : 인자의 개수
		$0 : 프로그램 이름
		$1 : 프로그램에 대한 첫번째 인자
		$2 : 프로그램에 대한 두번째 인자
		$3 : 프로그램에 대한 세번째 인자
			(해제) # unset VAR 
	● 함수 - alias와 같이 선언하여 명령어 처럼 사용함!
	(선언) # a() { ls; date; cal; }   or   function a { ls; date; cal; }
	(실행) # a 
	(확인) # typeset -f 
	(해제) # unset -f a 
	[참고] CMD -> alias -> function -> script
	● 그룹화(Grouping) 
		( ls ; pwd ; date ) > outputfile 
	● 조건 연산자 ( && , || )
	● 메타캐릭터(Metacharacter)		: ''  ""  ``  ;
	● 히스토리(History)				: history	
	● 환경파일(Environment Files)		: /etc/profile, ~/.bash_profile, ~/.bashrc

5) 쉘 스크립트 작성

	1. 프로그램 작성과 실행
		# bash -x script.sh
		# . ~/.bashrc
		# vi script.sh ' chmod +x script.sh ; ./script.sh
		
	2. 주석관리
		* 한줄 처리 - #
		* 여러 줄 처리 - : << EOF ~ EOF
	3. 입력과 출력
		출력 : echo CMD, printf CMD
		입력 : read CMD
		
#!/bin/bash

#svc.sh start sshd
# -> systemctl enable sshd
# -> systemctl restart sshd
# -> systemctl status sshd

#svc.sh stop sshd
# -> systemctl disable sshd
# -> systemctl stop sshd
# -> systemctl status sshd


-------------continue를 사용하여 문제를 확인하는 예제----------------

#!/bin/bash

egrep -i '(warn|fail|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp1
ㄴ 안좋은 단어를 검색함 (30초 전 파일)

while true - 참일때
do
    sleep 30 - 30초 쉬고
    egrep -i '(warn|fail|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp2
		ㄴ 30초 뒤에 파일을 다시 검사하여 tmp1 과 2의 차이점을 비교함
	diff /tmp/.tmp1 /tmp/.tmp2 > /tmp/.tmp3 && continue
		ㄴ 결과값이 저장된 tmp 파일들을 서로 비교해 같으면 continue!
    mailx -s "[WARN] Log Mail Check" root < /tmp/.tmp3
		ㄴ 결과값이 달라 아래로 내려와서 관리자에게 메일을 보내게 함 
    egrep -i '(warn|error|crit|alert|emerg)' /var/log/messages > /tmp/.tmp1
		ㄴ 다시 반복해서 검사하여 내용을 tmp1에 넣음
done

(기능)
목적: 로그 파일을 모니터링 하는 프로그램 작성
기능: 
● 로그 파일의 추가된 내용을 확인
● 로그 파일의 추가된 내용이 존재한다면 메일로 전송(To: root)
● 이 프로그램은 종료되면 안된다.(EX: Daemon)
● 사용하는 명령어: egrep -i '(warn|fail|err|crit|alert|emerg)' /var/log/messages
● 30초에 한번씩 로그 파일의 내용에 추가된 내용을 확인한다.

* diff 명령어 사용: diff file1 file2 = 파일1과 파일2의 차이점 비교


---------------FTP 사용 예제------------------------
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

*) IO 리다이렉션 자식 프로세스
	for LINE in $(cat file1)
	do
		echo $LINE
	done > file2
	----방법2(권장)---
	cat file1 | while read LINE
	do
		echo $LINE
	done > file2

*) 시그널 제어
	*시그널무시
	*시그널 받으면 개발자가 원하는 동작

*) 디버깅
	* bash -x script.sh
	* bash -xv script.sh
*) 옵션 처리
	getopts CMD + while CMD + case CMD
	(예) # ssh.sh -p 80 192.168.10.20
	while getopts p: options
	do
		case $options in
			p ) P_ACTION ;;
			\?) Usage    ;;
			* ) Usage    ;;
		esac
	done


-----------서버 체크 파일--------------------
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

----vscode 자동으로 켜지도록 설정------
* crontab + vskill.sh

kill $(ps -ef | grep -w code \
         | grep -v 'grep --color' \
         | awk '{print $2}' \
         | sort \
         | head -1)
---------------------------------

fdisk -l | grep LVM | awk '{print $1}' > pv1.txt
pvs | tail -n +2 | awk '{print $1}' > pv2.txt

ENV1.sh : 환경설정
	* $HOME/.bashrc
ENV2.sh : 필요한 패키지 설치
	* 패키지 설치 (gcc, php, vscode)
ENV3.sh : 서버 세팅
	텔넷 서버 - telnet-server
	ftp 서버 - vsftpd ftp
	ssh 서버 - openssh-server openssh-clients openssh-clients
	nginx 웹 서버 - yum -y install nginx
				  echo "Nginx webserver > /usr/share/nginx/html/index.html
				  systemctl enable --now nginx.server


cat << EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" 
EOF

yum install code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum install code

https://www.google.co.kr/chrome/thank-you.html?brand=YTUH&statcb=0&installdataindex=empty&defaultbrowser=0#

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O /root/bin/

yum localinstall google-chrome-stable_current_x86_64
