#!/bin/bash

outputDir=$HOME/networkInfo.txt 
networkInterface=$(ip addr | awk '/state UP/ {print $2}' | sed 's/.$//')
ipAddress=$(ifconfig ${networkInterface} | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
IP=(${ipAddress//./ })
DNS=$(grep "nameserver" /etc/resolv.conf | awk '{print $2}')

echo "Collecting network information. Please wait..."
echo "========== START ==========" > $outputDir 
date >> $outputDir
echo -e >> $outputDir

echo "========== ifconfig ==========" >> $outputDir 
ifconfig >> $outputDir
echo -e >> $outputDir

echo "========== netstat -rn ==========" >> $outputDir 
netstat -rn >> $outputDir
echo -e >> $outputDir

echo "========== route ==========" >> $outputDir 
route >> $outputDir
echo -e >> $outputDir

echo "========== cat /etc/network/interfaces ==========" >> $outputDir 
cat /etc/network/interfaces >> $outputDir
echo -e >> $outputDir

echo "========== cat /etc/resolv.conf ==========" >> $outputDir 
cat /etc/resolv.conf >> $outputDir
echo -e >> $outputDir

echo "========== ping ${DNS} ==========" >> $outputDir 
ping -c 4 $DNS >> $outputDir
echo -e >> $outputDir

echo "========== ping google.com ==========" >> $outputDir 
ping -c 4 google.com >> $outputDir
echo -e >> $outputDir

echo "========== ping ${IP[0]}.${IP[1]}.${IP[2]}.1 ==========" >> $outputDir 
ping -c 4 ${IP[0]}.${IP[1]}.${IP[2]}.1 >> $outputDir

echo "Finished. See the results in $outputDir"