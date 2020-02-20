#!/bin/bash

outputDir=$HOME/networkInfo.txt 

function main(){
    DNS=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
    IP=$(ip r | grep default | awk '{print $3}')

    echo "Collecting network information. Please wait..."
    echo "========== START ==========" > $outputDir 
    printf '%s\n' "$(date)" >> $outputDir

    echo "========== ifconfig ==========" >> $outputDir 
    printf '%s\n' "$(ifconfig)" >> $outputDir

    echo "========== netstat -rn ==========" >> $outputDir 
    printf '%s\n' "$(netstat -rn)" >> $outputDir

    echo "========== route ==========" >> $outputDir 
    printf '%s\n' "$(route)" >> $outputDir

    echo "========== cat /etc/network/interfaces ==========" >> $outputDir 
    printf '%s\n' "$(cat /etc/network/interfaces)" >> $outputDir

    echo "========== cat /etc/resolv.conf ==========" >> $outputDir 
    printf '%s\n' "$(cat /etc/resolv.conf)" >> $outputDir

    echo "========== ping "${DNS}" ==========" >> $outputDir 
    printf '%s\n' "$(ping -c 4 "${DNS}")" >> $outputDir

    echo "========== ping google.com ==========" >> $outputDir 
    printf '%s\n' "$(ping -c 4 google.com)" >> $outputDir

    echo "========== ping "${IP}" ==========" >> $outputDir 
    printf '%s\n' "$(ping -c 4 "${IP}")" >> $outputDir

    echo "Finished. See the results in $outputDir"
}

mode=$1
if  ! [ "$mode" == "test" ]; then
  main
fi