#!/bin/bash

# ----------------------------- VARIABLES ----------------------------- #

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NOCOLOR='\033[0m'

# ----------------------------- FUNCTIONS LOGIC ----------------------------- #

update () {
    echo
        echo -e "${BLUE} .................. Starting updates................. ${NOCOLOR}"
    echo
        sudo apt update && sudo apt upgrade -y
    echo
        echo -e "${BLUE} ---------------------------------------------------- ${NOCOLOR}"
    echo
        sudo snap refresh
        flatpak update
}

cleaning () { 
    echo    
        echo -e "${BLUE} ..................... Cleaning ..................... ${NOCOLOR}"
    echo
        sudo apt autoremove && sudo apt clean -y
    echo
        echo -e "${BLUE} ..................... All Done ..................... ${NOCOLOR}" 
}

options (){
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
}

# ----------------------------- FUNCTIONS ----------------------------- #

update

cleaning

echo
echo -e "${GREEN}
    What do you want to do? 

    ${NOCOLOR}Reboot${GREEN}: press ${NOCOLOR}r${GREEN} and ${NOCOLOR}Enter${GREEN};
    ${NOCOLOR}Poweroff${GREEN}: press ${NOCOLOR}p${GREEN} and ${NOCOLOR}Enter${GREEN};
    ${NOCOLOR}Stay in command Line${GREEN}: press ${NOCOLOR}Enter${GREEN}; 
    ${NOCOLOR}"
    
read answer;

options