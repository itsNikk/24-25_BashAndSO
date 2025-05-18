#!/bin/bash

ips=()
ipStatus=()

correctlyIsolated=0
falsePositives=0
infectedRemaining=0

init(){
	for i in {1..10}
	do
		ips[${#ips[@]}]="10.0.0."$i
		rndStatus=$(($RANDOM%3))
		case $rndStatus in
		0)
			ipStatus[${#ipStatus[@]}]="online"
		;;
		1)
			ipStatus[${#ipStatus[@]}]="offline"
		;;
		2)
			ipStatus[${#ipStatus[@]}]="infetto"
		;;
		esac
	done
}

scan(){
	for i in $(seq 0 9)
	do
		echo "${ips[$i]} : ${ipStatus[$i]}"
	done
}

checkIp() {
	ip=$1
	status=$(findIp $ip)
	if [ "$status" -eq -1 ]
	then
		echo "$ip non trovato"
	else
		echo "$ip : ${ipStatus[$status]}"
	fi
}

findIp() {
	for i in $(seq 0 9)
	do
		if [ ${ips[i]} == $1  ]
		then
			echo $i
			return
		fi
	done
	# -1 = ip non trovato
	echo -1
}

isolate() {
	ip=$1
	ipIndex=$(findIp $ip)
	echo "IP Isolation Procedure for $ip Initiated..."
	if [ ${ipStatus[$ipIndex]} == "infetto" ]
	then
		echo "${ips[$ipIndex]} is infected. changing to ISOLATED..."
		ipStatus[$ipIndex]="ISOLATED"
		((correctlyIsolated++))
	elif [ ${ipStatus[$ipIndex]} == "online" ] || [ ${ipStatus[$ipIndex]} == "offline" ]
	then
		echo "${ips[$ipIndex]} is either online or offline."
		ipStatus[$ipIndex]="ISOLATED"
		((falsePositives++))
	else
		echo "$ip is already isolated"
	fi
}

showReport(){
	echo "Net Report"
	echo "Correctly isolated IPs: $correctlyIsolated"
	echo "False positives: $falsePositives"
	for i in $(seq 0 9)
	do
		if [ ${ipStatus[$i]} == "infetto" ]
		then
			((infectedRemaining++))
		fi
	done
	echo "Infected remaining: $infectedRemaining"
}

quit() {
	showReport
	exit 0
}

clear
echo "Benvenuto in LanScope, software di analisi di rete."
init
scan
echo
# soluzione fatta per semplicità
echo "Controllo IP: ${ips[0]}"
checkIp ${ips[0]}
echo
echo "Controllo IP ${ips[4]}"
checkIp ${ips[4]}
echo
echo "Controllo IP 10.0.0.24"
checkIp 10.0.0.24
echo
read -p "inserisci IP da isolare: " ip
isolate $ip
echo
quit
