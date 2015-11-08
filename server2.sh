#!/bin/sh

set -x

sudo ip link set dev eth1 promisc on

# initiate a tcp connection with server1 to warmup the neigh cache
nc -w 1 192.168.50.4 22

# simulate a MAC change, but keep the ip the same. this could be a vm recreate 
# or other HA operation
sudo ip link set dev eth1 address 08:00:22:33:`openssl rand -hex 1`:`openssl rand -hex 1`
# add server1 MAC address as static. this will prevent this server to send an ARP request and will prevent server1 from cleaning the cache
# this will simulate some OpenStack environments. an arp response could come from a ARP proxy and will never reach server1 to invalidate its cache
sudo ip neigh replace 192.168.50.4 nud permanent dev eth1 lladdr 08:00:27:fb:93:99

# server2 is trying to contact server1 but is will fail indefinately
# until it waits for the neigh chace to get flushed on server1
watch -n 0.5 nc -w 1 192.168.50.4 22
