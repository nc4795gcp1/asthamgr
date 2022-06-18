#!/bin/bash
service manager-server enable
sleep 5
service manager-server start
while true; do sleep 1000; done
