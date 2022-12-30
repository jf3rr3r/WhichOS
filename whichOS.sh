#!/bin/bash

# Comprobando uso
if [[ -z $1 ]]; then
	echo -e "\n[*] Uso: ./whichOS.sh <ip_address>"
	exit 1
fi

# Obteniendo TTL
ttl=$(/usr/bin/ping -c 1 $1 2>/dev/null | grep ttl | awk '{print $6}' | cut -d "=" -f 2)

# Comprobando Sistema operativo
if [[ $ttl -ge 1 ]] && [[ $ttl -le 64 ]]; then
	echo -e "\n[+] $1 (ttl = $ttl)  -> Linux"
elif [[ $ttl -ge 65 ]] && [[ $ttl -le 128 ]]; then
	echo -e "\n[+] $1 (ttl = $ttl) -> Windows"
else
	echo -e "\n[!] Not Found"
fi
