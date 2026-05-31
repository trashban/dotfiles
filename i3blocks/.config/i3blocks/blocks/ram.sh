#!/usr/bin/env sh

ram=$(free --giga | awk '/^Mem:/ {print $3}')

echo "ram ${ram}GB"
