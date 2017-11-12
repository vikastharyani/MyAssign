#!/bin/bash

#Storing Hostnames entered as arguments to the script!
hostnames=$@

echo > ./host_names

for host in $(echo $hostnames | sed "s/,/ /g")
do
    echo "$host:22" >> ./host_names
done

#Enter the command to execute on all the hostnames!
echo "Enter the command to execute"
read -p 'Command: ' command

#User to login via ssh!
user=ec2-user

#PSSH is used to execute commands simultaneously on multiple servers

pssh -h host_names -l $user -t 10 -i "$command"

#Script Ends
echo All Done