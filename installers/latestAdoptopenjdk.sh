#!/bin/bash
#
# latestAdoptopenjdk.sh
#
# Created by Jacek Lajdekci on 22.2.2020
# Copyright © 2020 Jacek Lajdecki. All rights reserved.
#
# >> to run this script: 
#

latestAdaptopenJdk=$(curl -s 'https://api.adoptopenjdk.net/v2/info/releases/openjdk11/?&release=latest&os=linux&arch=x64&openjdk_impl=hotspot&type=jdk')
jdkLink=$(echo "${latestAdaptopenJdk}" | jq -r '.binaries[].binary_link')
jdkName=$(echo "${latestAdaptopenJdk}" | jq -r '.release_name')
jdkPath="/usr/lib/jvm/"
if [ ! -d "${jdkPath}/${jdkName}" ]; then
    curl -s -o "${jdkPath}" "${jdkLink}" | tar xvz
fi

