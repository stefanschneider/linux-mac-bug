#!/bin/sh

set -x

sudo ip link set dev enp0s8 promisc on

watch -n 0.5 nc -w 1 192.168.50.4 22
