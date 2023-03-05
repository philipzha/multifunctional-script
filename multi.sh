
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
bold(){
    echo -e "\033[1m\033[01m$1\033[0m"
}

Green_font_prefix="\033[32m" 
Red_font_prefix="\033[31m" 
Green_background_prefix="\033[42;37m" 
Red_background_prefix="\033[41;37m" 
Font_color_suffix="\033[0m"
yellow "Multifunctional bash Scripts by philipzha"
yellow "适用于linux的多功能使用脚本 基于bash 版本1.00 已知适用于centos6/7 debian ubuntu"
red "需要调用github开源项目"
bold " =================================================="
echo "请选择选项："
green "1.开启bbr及其他各类加速"
green "2.进行性能测试和网络测试"
green "3.更换ipv6/ipv4优先级"

bold " =================================================="
green "4.显示本机ip地址"
green "5.安装宝塔面板"
green "6. Linux换源"
green "7.route-trace路由追踪测试"
red "请输入功能选项："



read choice

if [ "$choice" = "1" ]; then
   bash <(curl -Lso- https://git.io/kernel.sh)
elif [ "$choice" = "2" ]; then
  bash <(curl -Lso- bench.sh)
elif [ "$choice" = "3" ]; then
  bash <(curl  -Lso- "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/ipv.sh" )
elif [ "$choice" = "4" ]; then
  curl ip.p3terx.com
elif [ "$choice" = "5" ]; then
  wget -O "/root/btbox.sh" "https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/btbox.sh" --no-check-certificate
  chmod +x "/root/btbox.sh"
  chmod 700 "/root/btbox.sh"
  bash /root/btbox.sh
elif [ "$choice" = "6" ]; then
  wget -O "/root/changesource.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/changesource.sh" --no-check-certificate
  chmod +x "/root/changesource.sh"
  chmod 700 "/root/changesource.sh"
  green "a.切换推荐源"
  green "b.切换中科大源"
    green  "c.切换亚马逊云源"
  green "d.切换阿里源"
  green "e.切换网易源"
  green "f.还原系统默认源"
  read source
    if [ "$source" = "a" ]; then
      bash changesource.sh
    elif [ "$source" = "b" ]; then
      bash changesource.sh cn
    elif [ "$source" = "c" ]; then
      bash changesource.sh aws
    elif [ "$source" = "d" ]; then
      bash changesource.sh aliyu
    elif [ "$source" = "e" ]; then
      bash changesource.sh 163
    elif [ "$source" = "f" ]; then
      bash changesource.sh restore
  else
    exit 1
  fi
elif [ "$choice" = "7" ]; then
  wget -O "/root/rt.sh" "https://raw.githubusercontent.com/BlueSkyXN/Route-trace/main/rt.sh" --no-check-certificate
  chmod +x "/root/rt.sh"
  chmod 777 "/root/rt.sh"
  bash "/root/rt.sh"
  
else
  red "无效的选项"
  exit 1
fi
