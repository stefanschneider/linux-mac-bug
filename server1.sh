#!/bin/sh

set -x

sudo ip link set dev enp0s8 promisc on

watch -n 0.5 ip -s neigh show
