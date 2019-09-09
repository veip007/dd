#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $NF;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/veip007/dd/master/InstallNET.sh' && chmod a+x InstallNET.sh

clear
echo "                                                      "
echo "######################################################"
echo "#                                                    #"
echo "#  Auto DD                                           #"
echo "#                                                    #"
echo "#  Last Modified: 2019-06-24                         #"
echo "#  默认密码：MoeClub.org                             #"
echo "#  Supported by MoeClub                              #"
echo "#                                                    #"
echo "######################################################"
echo "                                                      "
echo "IP: $MAINIP"
echo "网关: $GATEWAYIP"
echo "网络掩码: $NETMASK"
echo ""
echo "Please select an OS:"
echo "  1) CentOS 7 (DD)"
echo "  2) CentOS 6 (阿里云)"
echo "  3) CentOS 6"
echo "  4) Debian 7 x32"
echo "  5) Debian 8 x64"
echo "  6) Debian 9 x64"
echo "  7) Ubuntu 14.04x64"
echo "  8) Ubuntu 16.04x64"
echo "  9) Ubuntu 18.04x64"
echo ""
echo -n "Your option: "
read N
case $N in
  1) echo "Password: Pwd@CentOS" ; read -s -n1 -p "Press any key to continue..." ; bash InstallNET.sh --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK -dd 'https://api.moetools.net/get/centos-7-image' ;;
  2) bash InstallNET.sh -c 6.9 -v 64 -a --mirror 'http://mirrors.aliyun.com/centos-vault' --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $SUBNET ;;
  3) bash InstallNET.sh -c 6.9 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  4) bash InstallNET.sh -d 7 -v 32 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  5) bash InstallNET.sh -d 8 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  6) bash InstallNET.sh -d 9 -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  7) bash InstallNET.sh -u trusty -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  8) bash InstallNET.sh -u xenial -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  9) bash InstallNET.sh -u bionic -v 64 -a --ip-addr $MAINIP --ip-gate $GATEWAYIP --ip-mask $NETMASK ;;
  *) echo "Wrong input!" ;;
esac
