#!/bin/bash
#
# networkInfo.sh
#
# Created by Jacek Lajdekci on 22.2.2020
# Copyright © 2020 Jacek Lajdecki. All rights reserved.
#

function main(){
    if [ ! -d "${HOME}/networkInfo" ]; then
      mkdir ${HOME}/networkInfo
    fi
    outputDir="${HOME}/networkInfo/networkInfo_$(date +'%d_%m_%Y-%H_%M').txt"

    DNS=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
    IP=$(ip r | grep default | awk '{print $3}')

    echo "Collecting network information. Please wait..."
    echo "========== START ==========" > $outputDir 
    echo -e "$(date) \n" >> $outputDir

    echo "========== ifconfig ==========" >> $outputDir 
    echo -e "$(ifconfig) \n" >> $outputDir

    echo "========== netstat -rn ==========" >> $outputDir 
    echo -e "$(netstat -rn) \n" >> $outputDir

    echo "========== route ==========" >> $outputDir 
    echo -e "$(route) \n" >> $outputDir

    echo "========== cat /etc/network/interfaces ==========" >> $outputDir 
    echo -e "$(cat /etc/network/interfaces) \n" >> $outputDir

    echo "========== cat /etc/resolv.conf ==========" >> $outputDir 
    echo -e "$(cat /etc/resolv.conf) \n" >> $outputDir

    echo "========== ping "${DNS}" ==========" >> $outputDir 
    echo -e "$(ping -c 4 "${DNS}") \n" >> $outputDir

    echo "========== ping google.com ==========" >> $outputDir 
    echo -e "$(ping -c 4 google.com) \n" >> $outputDir

    echo "========== ping "${IP}" ==========" >> $outputDir 
    echo -e "$(ping -c 4 "${IP}") \n" >> $outputDir

    echo "Finished. Results are in $outputDir"
}

mode=$1
if  ! [ "$mode" == "test" ]; then
  main
fi