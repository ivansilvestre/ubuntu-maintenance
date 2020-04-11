#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NOCOLOR='\033[0m'

echo
echo -e "${GREEN} ..................... Starting updates..................... ${NOCOLOR}"
echo

sudo apt update && sudo apt upgrade -y

echo
echo -e "${BLUE} ---------------------------------------------------- ${NOCOLOR}"
echo

sudo snap refresh

echo
echo -e "${GREEN} .......... Cleaning cache and temporary files .......... ${NOCOLOR}"
echo

sudo apt autoremove && sudo apt autoclean

echo
echo -e "${BLUE} ..................... All Done ..................... ${NOCOLOR}"

echo -e "${GREEN} 
What do you want to do now? 

${NOCOLOR}Reboot${GREEN}: press ${NOCOLOR}r${GREEN} and ${NOCOLOR}Enter${GREEN};
${NOCOLOR}Poweroff${GREEN}: press ${NOCOLOR}p${GREEN} and ${NOCOLOR}Enter${GREEN};
${NOCOLOR}Stay in command Line${GREEN}: press ${NOCOLOR}Enter${GREEN}; 
${NOCOLOR}"

read answer;

if [[ $answer == 'r' ]]
then
    reboot
elif [[ $answer == 'p' ]]
then
    poweroff  
else
    echo -e "${BLUE} ---------------------------------------------------- ${NOCOLOR}"
    echo
fi
