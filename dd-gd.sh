#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $NF;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/veip007/dd/master/InstallNET.sh' && chmod a+x InstallNET.sh && wget -N --no-check-certificate https://github.com/veip007/Network-Reinstall-System-Modify/raw/master/Network-Reinstall-System-Modify.sh && chmod a+x Network-Reinstall-System-Modify.sh

clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#  Auto DD                                                #"
echo "#                                                         #"
echo "#  Last Modified: 2019-12-05                              #"
echo "#  Linux默认密码：MoeClub.org  or  cxthhhhh.com           #"
echo "#  Supported by MoeClub                                   #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo "IP: $MAINIP"
echo "网关: $GATEWAYIP"
echo "网络掩码: $NETMASK"
echo ""
echo "请选择您需要的镜像包:"
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
echo "  自定义安装请使用：bash InstallNET.sh -dd '您的直连'"
echo ""
echo -n "请输入编号: "
read N
case $N in
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
  11) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1qhE4hHkCAgAiRby8WHngNduHHhqrUeMQ';;
  12) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1IXdK-ruDrNmorxZRoJaep1Fo9p4aPi0s' ;;
  13) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1JnbvgbvF4hzT1msk1RJ-rjrzqqzTwI1I' ;;
  14) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1vz2Y9kPlbRYdP8blD0oGs5MY7EfYVgFR' ;;
  15) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1dvNvV9OLm-x6p9sUbnRrKTLDuaiVj_Kg' ;;
  16) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1O3jXs9KagrCb1SbM-DVZMAZ7gw9r3Vtp' ;;
  17) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1PLG3EdCziMMTIWz1vnUupMPmje2pQX43' ;;
  18) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=16Xh4iq6guHWT92MAr-NCOzStZqMTdnmU' ;;
  19) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://drive.google.com/open?id=1rzkH24tCtwPvcT3HquoF9tZgcj022voG' ;;
  20) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1wtUWaag5pVwmN-QUfTSJ6xbNWulLbLy-' ;;
  21) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://www.lefu.men/gdzl/index.php?id=1GUdLXMwBx4uM8-iBU6ClcD5HRmkURuEl' ;;
  22) bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd "https://www.lefu.men/gdzl/index.php?id=1gGUD4lNp6GapR_-78LlmleDRW55Ao0r9" ;;
  *) echo "Wrong input!" ;;
esac 
