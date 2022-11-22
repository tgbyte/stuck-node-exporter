#!/bin/bash

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

go run main.go &
echo "Sleeping..."
sleep 1
echo "Test starting..."
for i in {0..1000000} ; do curl localhost:9100/metrics ; done
