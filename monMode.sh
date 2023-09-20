!/bin/bash

#purpose: set specified adapter to monitor mode and disable NetworkManger/wpa_supplicant
#usage: sudo ./monMode.sh <adapter>
#example:  sudo ./monMode.sh wlan1


#bring down <adapter>
sudo ip link set ${1} down
sleep 2

#set <adapter> to monitor mode
sudo iw ${1} set monitor none
sleep 1

#kill services
sudo systemctl stop NetworkManager.service
sudo systemctl stop wpa_supplicant.service

#bring up <adapter>
sudo ip link set ${1} up


#check work
iwconfig ${1}
