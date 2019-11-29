#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NOCOLOR='\033[0m'

echo -e "${GREEN} .......... Starting .......... ${NOCOLOR}"

sudo apt update && sudo apt upgrade

echo -e "${BLUE} ---------------------------------------------------- ${NOCOLOR}"

sudo snap refresh

echo -e "${BLUE} ---------------------------------------------------- ${NOCOLOR}"

echo -e "${GREEN} .......... All Done .......... ${NOCOLOR}"