#!/usr/bin/env sh

_ip=$(wget -qO - icanhazip.com)

echo "ip ${_ip}"
