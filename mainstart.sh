#!/bin/bash
# Minecraft Server restart script
# by Firenado 
# january 2022
#

GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RED=`tput setaf 1`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`
RESET=`tput sgr0`
BOLD=`tput bold`

echo "${GREEN}Loading...${RESET}"
cd "$( dirname $0 )"
source config.cfg
cd $minecraftDir

echo "server starting on screen ${CYAN}$Nick ${WHITE}"
echo "${YELLOW}[+] ${RESET}to view the server CLI you must exit this screen by pressing ${CYAN}CTRL+a ${RESET}and then press ${CYAN}d ${RESET}after"
echo "${YELLOW}[+] ${RESET}to join the server screen type in the terminal ${RESET}${CYAN}screen -r $Nick ${RESET}"
echo "${YELLOW}[+] ${RESET}to stop this script press ${CYAN} CTRL+C ${RESET}"
echo "${YELLOW}[+] ${RESET}to stop the server join the screen on ${CYAN}$Nick ${RESET} and either press ${CYAN} CTRL+C ${RESET} or type ${CYAN} stop ${RESET} in the mc console ${RESET}"

while true; do
	screen -dmS $Nick java -Xms$initial -Xmx$max -Dlog4j2.formatMsgNoLookups=true -jar $minecraftJar nogui			#start server (updated due to log4shell lol)
	sleep 10
	screen -p 0 -S $Nick -X eval "stuff \"say restart complete\"\015"

	for ((i = 0 ; i < $Hours ; i++)); do															# loop every hour instead of just haveing a phone number sized sleep time
		printf "Server has been up for ${CYAN}$i ${RESET}hours    \r"
		screen -p 0 -S $Nick -X eval "stuff \"say Server has been up for $i hours\"\015"
		sleep 3600
	done
	
	echo "${RED}server stopping ${RESET}"
	screen -p 0 -S $Nick -X eval "stuff \"stop\"\015"												# stop server after the loop is done 
done 

