#!/bin/sh


sh_ver="1.0.1"




#0升级脚本
Update_Shell(){
	sh_new_ver=$(wget --no-check-certificate -qO- -t1 -T3 "https://raw.githubusercontent.com/veip007/hj/master/hj.sh"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1) && sh_new_type="github"
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} 无法链接到 Github !" && exit 0
	wget -N --no-check-certificate "https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh" && chmod +x dd-gd.sh
	echo -e "脚本已更新为最新版本[ ${sh_new_ver} ] !(注意：因为更新方式为直接覆盖当前运行的脚本，所以可能下面会提示一些报错，无视即可)" && exit 0
}




MAINIP=$(ip route get 1 | awk '{print $NF;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/veip007/dd/master/InstallNET.sh' && chmod a+x InstallNET.sh && wget -N --no-check-certificate https://github.com/veip007/Network-Reinstall-System-Modify/raw/master/Network-Reinstall-System-Modify.sh && chmod a+x Network-Reinstall-System-Modify.sh

clear
echo "                                                              "
echo "##############################################################"
echo "#                                                            #"
echo "#  Auto DD                                                   #"
echo "#                                                            #"
echo "#  Last Modified: 2021-01-25                                 #"
echo "#  Linux默认密码：MoeClub.org  or  cxthhhhh.com  or  nat.ee  #"
echo "#  Supported by MoeClub                                      #"
echo "#                                                            #"
echo "##############################################################"
echo "                                                              "
echo "IP: $MAINIP"
echo "网关: $GATEWAYIP"
echo "网络掩码: $NETMASK"
echo ""
echo "请选择您需要的镜像包:"
echo "  0) 升级本脚本"
echo "  1) CentOS 7 (DD) 用户名：root 密码：Pwd@CentOS"
echo "  2) CentOS 6 (阿里云镜像) 用户名：root 密码：MoeClub.org"
echo "  3) CentOS 6 用户名：root 密码：MoeClub.org"
echo "  4) Debian 7 x32 用户名：root 密码：MoeClub.org"
echo "  5) Debian 8 x64 用户名：root 密码：MoeClub.org"
echo "  6) Debian 9 x64 用户名：root 密码：MoeClub.org"
echo "  7) Debian 10 x64 用户名：root 密码：cxthhhhh.com"
echo "  8) Ubuntu 14.04x64 用户名：root 密码：MoeClub.org"
echo "  9) Ubuntu 16.04x64 用户名：root 密码：MoeClub.org"
echo "  10) Ubuntu 18.04x64 用户名：root 密码：MoeClub.org"
echo "  11) 萌咖Win7x64 用户名:Administrator  密码：Vicer"
echo "  12) Win2019 By:MeowLove  密码：cxthhhhh.com"
echo "  13) Win2016 By:MeowLove  密码：cxthhhhh.com"
echo "  14) Win2012 R2 By:MeowLove  密码：cxthhhhh.com"
echo "  15) Win2008 R2 By:MeowLove  密码：cxthhhhh.com"
echo "  16) Windows 7 Vienna By:MeowLove  密码：cxthhhhh.com"
echo "  17) Windows 2003 Vienna By:MeowLove  密码：cxthhhhh.com"
echo "  18) Win7x32 By:老司机  用户名:Administrator  密码：Windows7x86-Chinese"
echo "  19) Win-2003x32 By:老司机  用户名:Administrator  密码：WinSrv2003x86-Chinese"
echo "  20) Win2008x64 By:老司机  用户名:Administrator  密码：WinSrv2008x64-Chinese"
echo "  21) Win2012R2x64 By:老司机  用户名:Administrator  密码：WinSrv2012r2"
echo "  22) CentOS 8 用户名：root 密码：cxthhhhh.com 推荐512M以上使用"
echo "  23) Win7x64 By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  24) Win7x64 Uefi启动的VPS专用(如:甲骨文)By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  25) Win8.1x64 By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  26) Win8.1x64 Uefi启动的VPS专用(如:甲骨文)By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  27) 2008r2x64 By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  28) 2008r2x64 Uefi启动的VPS专用(如:甲骨文)By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  29) Win8.1x64 By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  30) Win8.1x64 Uefi启动的VPS专用(如:甲骨文)By:net.nn  用户名:Administrator  密码：nat.ee"
echo "  自定义安装请使用：bash InstallNET.sh -dd '您的直连'"
echo ""
echo -n "请输入编号: "
read N
case $N in
  0) wget -N --no-check-certificate "https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh" && chmod +x dd-gd.sh ;;
  1) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://api.moetools.net/get/centos-7-image' ;;
  2) bash InstallNET.sh -c 6.9 -v 64 -a --mirror 'http://mirrors.aliyun.com/centos-vault' --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $SUBNET ;;
  3) bash InstallNET.sh -c 6.9 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  4) bash InstallNET.sh -d 7 -v 32 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  5) bash InstallNET.sh -d 8 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  6) bash InstallNET.sh -d 9 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  7) bash Network-Reinstall-System-Modify.sh -Debian_10 ;;
  8) bash InstallNET.sh -u trusty -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  9) bash InstallNET.sh -u xenial -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  10) bash InstallNET.sh -u bionic -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  11) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1qhE4hHkCAgAiRby8WHngNduHHhqrUeMQ';;
  12) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1IXdK-ruDrNmorxZRoJaep1Fo9p4aPi0s' ;;
  13) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1JnbvgbvF4hzT1msk1RJ-rjrzqqzTwI1I' ;;
  14) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1vz2Y9kPlbRYdP8blD0oGs5MY7EfYVgFR' ;;
  15) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1dvNvV9OLm-x6p9sUbnRrKTLDuaiVj_Kg' ;;
  16) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1O3jXs9KagrCb1SbM-DVZMAZ7gw9r3Vtp' ;;
  17) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1PLG3EdCziMMTIWz1vnUupMPmje2pQX43' ;;
  18) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=16Xh4iq6guHWT92MAr-NCOzStZqMTdnmU' ;;
  19) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://drive.google.com/open?id=1rzkH24tCtwPvcT3HquoF9tZgcj022voG' ;;
  20) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1wtUWaag5pVwmN-QUfTSJ6xbNWulLbLy-' ;;
  21) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/?id=1GUdLXMwBx4uM8-iBU6ClcD5HRmkURuEl' ;;
  22) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1gGUD4lNp6GapR_-78LlmleDRW55Ao0r9" ;;
  23) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1fGsryTy6xZi5EC9GlOpvqTK-Uty0_gFo" ;;  
  24) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1LxzyhswxkpI_BqUolnI0HyawNvPQJHAO" ;; 
  25) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1SKUFoUujxh3sTtLIWWcBW8riibd1q5ka" ;; 
  26) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1GUz7Suysv0S7qRuyB9vQ_IGkTbFckFcE" ;; 
  27) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1eA35gszGgUXI6P7dR5g5sqsIPnMJwUuN" ;; 
  28) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1a8gEiZTEG5aeTrTflP9icAZF-HJhYU1N" ;; 
  29) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1eboWyVSkt1Hcnsl2dqgA-8p40Qbk2QvG" ;; 
  30) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/?id=1IY8IyLt66uKhZ7Jb4QzEb_bTUUqU76_3" ;; 
  *) echo "Wrong input!" ;;
esac 
