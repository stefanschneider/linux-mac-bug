#!/bin/sh

set -x

sudo ip link set dev eth1 promisc on

watch -n 0.5 ip -s neigh show
