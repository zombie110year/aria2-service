#! bash

# 检测 Aria2 安装
which aria2c 2>/dev/null 1>/dev/null && echo "aria2c has been installed" || echo "aria2c not installed, you need install it by package manager"

# 迁移默认配置
[[ -d /etc/aria2 ]] || ( sudo mkdir -p /etc/aria2 && echo "/etc/aria2 created" )
sudo cp -f aria2.conf /etc/aria2/aria2.conf && echo "cp aria2.conf"
[[ -d /data ]] || ( sudo mkdir /data && echo "/data created" )
[[ -d /data/Downloads ]] || sudo mkdir /data/Downloads
[[ -d /data/aria2 ]] || sudo mkdir /data/aria2
[[ -f /data/aria2/session ]] || ( sudo touch /data/aria2/session && echo "session file created" )

# Systemctl 配置
sudo cp -f ./aria2.service /etc/systemd/system/aria2.service
sudo systemctl enable aria2
echo "aria2.service enabled, run 'sudo systemctl start aria2' to start service"

