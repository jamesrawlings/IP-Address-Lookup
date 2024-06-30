#!/bin/bash

if [ -z "$1" ];
then 
	echo "Usage:  $0 <IP_ADDRESS>" 
exit 1
fi

IP_ADDRESS=$1

response=$(curl -s "https://ipinfo.io/${IP_ADDRESS}/json")

location=$(echo $response | jq -r '.loc')

if [ "$location" == "null" ];
then 
	echo "Location data not available for IP Address: $IP_ADDRESS"
	exit 1
fi

latitude=$(echo $location | cut -d',' -f1)
longitude=$(echo $location | cut -d',' -f2)

google_maps_url="https://www.google.com/maps?q=${latitude},${longitude}"


echo "$response"
echo "Google Maps URL: $google_maps_url"
