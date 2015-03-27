#! /bin/bash

MOD=$1

for makefile in $(find $KERNEL -name "Makefile"); do
	conf=$(sed "\
		s/obj-\\\$[\(]CONFIG_\(.*\)[\)][\t\ ]*[\+]=[\t\ ]*$MOD\.o.*/\1/
		;t;d" $makefile)
	if [[ ! -z "$conf" ]]; then
		echo $conf
		exit 0
	fi
done
echo ${MOD^^}
exit 1
