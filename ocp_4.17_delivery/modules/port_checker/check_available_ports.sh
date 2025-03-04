#!/bin/bash

# order is important
start_port=$1
end_port=$2
ssh_host=$3

server_ports=$(sshpass -p 'root@password' ssh -o StrictHostKeyChecking=no root@$ssh_host netstat -tuln | grep ':8' | awk -F: '{print $2}' | awk '{print $1}' | sort -n)

for port in $(seq $start_port $end_port); do
  if ! echo "$server_ports" | grep -q "$port"; then
    echo "$port" > /opt/terraform/modules/port_checker/available_port.txt
    break
  fi
done
