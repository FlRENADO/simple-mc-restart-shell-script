#!/bin/bash
# Minecraft Start Script V2
# by Firenado 
# january 2022
#

GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
CYAN=`tput setaf 6`
RESET=`tput sgr0`
source config.cfg

echo "${GREEN}Loading...${RESET}"
screen -ls | grep "restartscript" | awk '{print $1}' | xargs -r -i -n1 screen -X -S {} quit
echo "${GREEN}Loading...${RESET}"
if screen -list | grep -q "${Nick}"; then						# Check if server is already running (or atleast one with the same name)
	echo -e "${RED}SERVER IS ALREADY RUNNING ${RESET}"
	exit 1
else
	cd "$( dirname $0 )"
	echo "${GREEN}Loading....${RESET}"
	screen -S restartscript bash -c ./mainstart.sh
	echo "${YELLOW}Starting ${RESET}Minecraft management script ${CYAN}(mainstart.sh)${RESET}"
fi