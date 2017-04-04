DOTFILES := $(shell pwd)
APPS_DIR = 
BIN_DIR = ~/bin

install:
	./scripts/install.sh
	git submodule init
	git submodule update

base16_shell:
	base16_tomorrow-night

clean:
	$(shell reload!)
	clear

.PHONY: install base16_shell clean