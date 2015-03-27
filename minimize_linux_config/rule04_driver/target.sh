#! /bin/sh

SYSBUS=/sys/bus
SYSDEV=/sys/devices

for bus in $(ls $SYSBUS); do
	bus_dir=$SYSBUS/$bus
	drivers_dir=$bus_dir/drivers
	# drivers can have space in their name, so we don't use for
	ls $drivers_dir | while read driver; do
		driver_dir="$drivers_dir/$driver"
		ndevices=$(for file in $(ls "$driver_dir"); do
			full_path="$driver_dir/$file"
			[[ ! -L "$full_path" ]] && continue
			realpath "$full_path" | grep $SYSDEV
		done | wc -l)
		[[ "$ndevices" != "0" ]] && continue
		module_link=$driver_dir/module
		if [[ -e $module_link ]]; then
			module=$(basename $(realpath $module_link))
		else
			module=$driver
		fi
		echo $module
	done
done

exit 0
