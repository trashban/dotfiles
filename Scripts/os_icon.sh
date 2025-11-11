#!/usr/bin/env bash

# simply echo the current distro used
# the waybar module itself handles grabbing the correct icon

source /etc/os-release
echo "{\"alt\": \"$ID\"}"
