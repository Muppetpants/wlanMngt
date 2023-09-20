#!/bin/bash


#purpose: set adapter to monitor mode and disable NetworkManger
#usage: sudo ./restoreMode.sh <adapter>
#example: sudo ./restoreMode.sh wlan1


#bring down <adapter>
sudo ip link set ${1} down
sleep 1

#set <adapter> to managed mode
sudo iw ${1} set type managed
sleep 1

#restart services
sudo systemctl start NetworkManager.service
sleep 1
sudo systemctl start wpa_supplicant.service

#bring up <adapter>
sudo ip link set ${1} up


#check work
iwconfig ${1}
