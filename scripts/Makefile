default: run

conf:
	for c in $$(ls *-config); do cp -fv $$c $${c%-config}/.config; done

run:
	@scripts/run.sh buildroot/output/images
