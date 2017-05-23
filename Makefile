install:
	@./scripts/install.sh
	git submodule update --init --recursive

base16_shell:
	base16_tomorrow-night

# redshift:
	# add redshift-gtk to autostart

clean:
	$(shell reload!)
	clear

.PHONY: install base16_shell clean
