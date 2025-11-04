#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

alertUser(){
    echo -e "$1 $2 ${NC}"
}

alertUser ${YELLOW} "****FIND PART 1 **** "
cd p1 

alertUser ${GREEN} "DONE \n"

alertUser "${YELLOW}**** UP the Machines **** \n"

vagrant up &> /dev/null

status=$?

if [ $status -eq 0 ]; then
    alertUser ${GREEN} "Vagrant up succed Machines Expected to be Up "
else
    alertUser "${RED}"" Error while running ** Vagrant up ***"
fi

if vagrant status | grep -w "$USER"S ; then
    alertUser "${GREEN}" "THe server Machine is Up with correct name\n"

else
    alertUser "${RED} " "Something is wrong with Server Machine Pay attention\n"
fi

if  vagrant status | grep -w "$USER"Sw ; then
    alertUser "${GREEN} " "THe agent Machine is Up with correct name \n"
else
    alertUser "${RED}" "Something is wrong on agent Machine Pay attention\n"
fi

alertUser "${YELLOW}" "****CHECK THE IP ADDRESS OF THE SERVER MACHINE **** \n"
    vagrant ssh "$USER"S -c "ip addr | grep \"192.168.56.110\" "

alertUser "${YELLOW}" " **** CHECK THE IP ADDRESS OF THE AGENT MACHINE ****\n"
    vagrant ssh "$USER"Sw -c "ip addr | grep -w \"192.168.56.111\" "


alertUser "${YELLOW}" "****Check k3s installation on Server**** "

if vagrant ssh "$USER"S -c "command -v k3s" &> /dev/null; then
    alertUser "${GREEN}" " k3s is installed For Server\n"
else
    alertUser "${RED}" " k3s is NOT installed for Server\n"
fi

alertUser "${YELLOW}" "**** Check k3s installation on Agent Machine ****"

if vagrant ssh "$USER"Sw -c "command -v k3s" &> /dev/null; then
    alertUser "${GREEN}" " k3s is installed for Agent"
else
    alertUser "${RED}" " k3s is NOT installed for Agent"
fi


alertUser "${YELLOW}" "**** check the Connection between Agent and Server ****"
# get hostnames
serverHost=$(vagrant ssh "$USER"S -c "hostname | tr -d '\r\n'")
workerHost=$(vagrant ssh "$USER"Sw -c "hostname | tr -d '\r\n'")

to_lower() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

serverHost=$(to_lower "$serverHost")
workerHost=$(to_lower "$workerHost")


if vagrant ssh "$USER"S -c "sudo kubectl get nodes | grep -E \"$workerHost\"" &> /dev/null; then
    alertUser $BLUE "Agent is Joined the server succesfully"
fi

# vagrant destroy -f &> /dev/null