#!/bin/bash

# Exit on error
set -e 

# ----------------------------- COLORS ----------------------------- #

readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m' 
readonly RED='\033[0;31m'
readonly NOCOLOR='\033[0m'

# ----------------------------- FUNCTIONS LOGIC ----------------------------- #

system_update() {
    print_message "$BLUE" "Starting system updates..."
    
    if ! sudo apt update && sudo apt upgrade -y; then
        print_message "$RED" "Error during APT update/upgrade"
        return 1
    fi
    
    if command -v snap >/dev/null; then
        sudo snap refresh
    fi
    
    if command -v flatpak >/dev/null; then
        flatpak update -y
    fi
    
    print_message "$GREEN" "System updates completed successfully"
}

update_system_components() {
    print_message "$BLUE" "Checking for system component updates..."
    
    if command -v ubuntu-drivers >/dev/null; then
        if sudo ubuntu-drivers autoinstall; then
            print_message "$GREEN" "System components updated successfully"
        else
            print_message "$RED" "Error updating system components"
            return 1
        fi
    else
        print_message "$BLUE" "ubuntu-drivers not found. Skipping system component update."
    fi
}

system_cleanup() {
    print_message "$BLUE" "Starting system cleanup..."
    
    if ! sudo apt autoremove -y && sudo apt clean -y; then
        print_message "$RED" "Error during system cleanup"
        return 1
    fi
    
    print_message "$GREEN" "System cleanup completed successfully"
}

power_options (){
    print_message "$BLUE" "Select power option:"
    echo -e "${GREEN}[r]${NOCOLOR} Reboot"
    echo -e "${GREEN}[p]${NOCOLOR} Power off"
    echo -e "${GREEN}[Enter]${NOCOLOR} Stay in terminal"

    read -r answer

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

# ----------------------------- HELPER FUNCTIONS ----------------------------- #

print_message() {
    local color=$1
    local message=$2
    printf "${color}%s${NOCOLOR}\n" "$message"
}

# ----------------------------- MAIN EXECUTION ----------------------------- #

main() {
    system_update
    update_system_components
    system_cleanup
    power_options
}

main