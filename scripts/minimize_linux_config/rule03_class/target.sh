#! /bin/sh

SYSCLASS=/sys/class

for class in $(ls $SYSCLASS); do
	class_dir=$SYSCLASS/$class
	ndevices=$(find $class_dir -type l -maxdepth 1 | wc -l)
	[[ "$ndevices" == "0" ]] && echo $class
done

exit 0
