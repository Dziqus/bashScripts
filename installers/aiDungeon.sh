#!/bin/bash
#
# using https://github.com/Eigenbahn/ai-dungeon-cli
#
# Created by Jacek Lajdekci on 27.2.2020
# Copyright © 2020 Jacek Lajdecki. All rights reserved.
#
# to run: bash <(curl -Ss https://raw.githubusercontent.com/Dziqus/bashScripts/master/installers/aiDungeon.sh)
#

cd ~/
if [ ! -d ~/ai-dungeon-cli/ ]; then
    sudo git clone https://github.com/Eigenbahn/ai-dungeon-cli.git
    sudo chown -R jla ai-dungeon-cli 
    cd ai-dungeon-cli/
    sudo python3 -m pip install -r requirements.txt
fi
if [ ! -d ~/ai-dungeon-cli/ai_dungeon_cli/config.yml ]; then
    read -p 'EMAIL for play.aidungeon.io:' email
    read -sp 'PASSWORD for play.aidungeon.io:' password
    sudo printf "email: '${email}'\npassword: '${password}'" > ~/ai-dungeon-cli/ai_dungeon_cli/config.yml
fi
sudo ~/ai-dungeon-cli/ai_dungeon_cli/__init__.py