#!/usr/bin/env bash
slurp | grim -g - ~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')
