#!/bin/bash


host=$(hostname -s)

seconds=0
ip="0.0.0.0"
port=514
protocol="tcp"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - Logs Sender is a script to test machines connected to a SIEM. By default, it will send logs though tcp/514 if no"
      echo "parameter is changed"
      echo " "
      echo "$package ./LogSender [options] [protocol]"
      echo " "
      echo "-------------------- OPTIONS --------------------------"
      echo " "
      echo "-h, --h                show brief help"
      echo "-a, --ip               The IP of the event collector"
      echo "-p, --port             The port to send the logs. By default is 514"
      echo "-t, --time             The seconds interval between logs. If no time is specified, the logs will be sent as fast as possible"
      echo " "
      echo "-------------------- PROTOCOLS --------------------------"
      echo " "
      echo "--tcp                  The protocol to be used. Only supports tcp/udp. By default is TCP"
      echo "--udp                  The protocol to be used. Only supports tcp/udp. By default is TCP"
      exit 0
      ;;
    -a|--ip)
      shift
      ip=$1
      shift
      ;;
    -t|--time)
      shift
      seconds=$1
      shift
      ;;
    -p|--port)
      shift
      port=$1
      shift
      ;;
    --tcp)
      protocol="tcp"
      shift
      ;;
    --udp)
      protocol="udp"
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [ "$ip" == "0.0.0.0" ]; then
    echo "You have to specify the IP to send the logs with the flag -a | --ip"
    exit 1
fi


echo "The logs will be sent to the IP: $ip through the protocol/port: $protocol/$port"


if [ $seconds -gt 0 ]; then
    echo "The logs will be sent every $seconds seconds" 
else
    echo "The logs will be sent as fast as possible"
fi


while :; do

  if [ $seconds -gt 0 ];
  then
    sleep $seconds
  fi

  pid=$RANDOM

  user=$(shuf -zer -n3 {a..z})

  address=$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))

  echo "$(date +'%b %d %H:%M:%S') $host sshd[$pid]: Accepted password for $user from $address port $RANDOM ssh2" >/dev/$protocol/$ip/$port

  echo "$(date +'%b %d %H:%M:%S') $host sshd[$pid]: pam_unix(sshd:session): session opened for user $user by (uid=$RANDOM)" >/dev/$protocol/$ip/$port

done