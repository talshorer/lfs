#! /bin/sh

SYSBUS=/sys/bus

for bus in $(ls $SYSBUS); do
	bus_dir=$SYSBUS/$bus
	ndevices=$(ls $bus_dir/devices | wc -l)
	[[ "$ndevices" == "0" ]] && echo $bus
done

exit 0
