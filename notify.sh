#!/bin/bash
USERID="325557880"
KEY="839507140:AAH6pIjzf6qYa1eybkLRR80bg1S1K6oZqis" 
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
DATE_EXEC="$(date "+%d %b %Y %H:%M")" #Collect date & time.
TMPFILE="$(mktemp)" #Create a temporary file to keep data in. # True temporary file
if [ -n "$SSH_CLIENT" ] && [ -z "$TMUX" ]; then #Trigger
IP=$(echo $SSH_CLIENT | awk '{print $1}') #Get Client IP address.
PORT=$(echo $SSH_CLIENT | awk '{print $3}') #Get SSH port
HOSTNAME=$(hostname -f) #Get hostname
IPADDR=$(hostname -I | awk '{print $1}')
curl https://ipinfo.io/$IP -s -o $TMPFILE #Get info on client IP.
IP_INFOS="$(curl https://ipinfo.io/$IP -s -o $TMPFILE | jq -r '.org + " - " + .city + ", " + .region + ", " + .country')" #Client IP info parsing via jq
TEXT="$DATE_EXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP - ${IP_INFOS} port $PORT"
curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
rm $TMPFILE #clean up after
fi
