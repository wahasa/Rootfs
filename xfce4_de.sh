#!/bin/bash

#Get the necessary components
[ ! -f /root/.parrot ] && apt-get update || echo "Parrot detected, not updating apt cache since that will break the whole distro"
apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
dpkg --configure -a
apt-mark hold udisks2
apt install sudo wget nano -y
apt install keyboard-configuration -y
apt install tzdata -y

#Desktop environment installation
sudo apt install xfce4 xfce4-goodies -y
sudo apt install tigervnc-standalone-server dbus-x11 -y
sudo apt --fix-broken install
sudo apt clean

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/Techriz/AndronixOrigin/master/APT/XFCE4/vncserver-stop -P /usr/local/bin/

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo " "
echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncserver-start
