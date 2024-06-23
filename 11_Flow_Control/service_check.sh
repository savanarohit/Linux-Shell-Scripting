#!/bin/bash
# Script to check if a service is up or not on multiple Linux Servers

# Servers
node=("node1.abc.com" "node2.abc.com" "node3.abc.com")

# Service
sevice="apache2"

# Check service on each node
for server in "${node[0]}"; do
    echo "Checking nodes: $node"

    # Check if the node is up
    if ! ping -c 1 -W 1 "${node}" $ >/dev/null; then
        echo "Node $node is down"
        continue
    fi

    # Check the service
    ssh "$node" "systemctl is-active --quiet $node"

    if [ $? -eq 0 ]; then
        echo "Service $sevice is up $node"
    else
        echo "Service $sevice is down on $node"
    fi
done
