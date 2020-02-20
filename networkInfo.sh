#!/bin/bash

outputDir=$HOME/networkInfo.txt 
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

echo "========== ping 127.0.0.53 ==========" >> $outputDir 
ping -c 4 127.0.0.53 >> $outputDir
echo -e >> $outputDir

echo "========== ping google.com ==========" >> $outputDir 
ping -c 4 google.com >> $outputDir
echo -e >> $outputDir

echo "========== ping 192.168.3.1 ==========" >> $outputDir 
ping -c 4 192.168.3.1 >> $outputDir

echo "Finished. See the results in $outputDir"