#!/bin/bash
# prboom+ launch script | amby 
# v1

# default variables 
maploc="documents/doom/wad/map/"
modloc="documents/doom/wad/mod/"
mapcount=0
modcount=0

# iwad-selection
echo "prboom+ bash script"
echo "IWAD (requred):"
read iwad 

# mod selection
echo "MOD (empty=none):"
read mod

if [ "${#mod}" -ne "0" ]; then
	modcount=1
else
	modcount=0
fi

# map selection
echo "MAP (empty=none):"
read map

if [ "${#map}" -ne "0" ]; then
	mapcount=1
else 
	mapcount=0
fi

# comp-level selection
echo "Comp-level (-1 = default):"
read level

# launch-script
if [ "$mapcount" -eq "0" ]; then
	if [ "$modcount" -eq "0" ]; then
		prboom-plus \
			-iwad $iwad \
			-complevel $level
	elif [ "$modcount" -eq "1" ]; then
		prboom-plus \
			-iwad $iwad \
			-file $modloc$mod \
			-complevel $level
	fi
elif [ "$mapcount" -eq "1" ]; then
	if [ "$modcount" -eq "0" ]; then
		prboom-plus \
			-iwad $iwad \
			-file $maploc$map \
			-complevel $level
	elif [ "$modcount" -eq "1" ]; then
		prboom-plus \
			-iwad $iwad \
			-file $maploc$map \
			$modloc$mod \
			-complevel $level 
	fi
else
	echo "Fatal error including mapcount."
fi


