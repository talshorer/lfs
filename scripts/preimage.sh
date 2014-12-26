#! /bin/bash
TARGET=$1
cd $(realpath $(dirname $0))/preimage
for s in $(ls); do
	if [[ -z $(echo "$s" | sed "s/.*~//") ]]; then continue; fi
	echo "=== running $s ==="
	./$s "$TARGET"
done
