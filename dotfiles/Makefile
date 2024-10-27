# A list of the dotfiles one wish to create a symbolic link to from $(HOME)
DOTFILES := .zshrc .aliases .gitconfig .config/nvim .pdbrc
DOTFILE_DST := $(DOTFILES:%=$(HOME)/%)

.PHONY: install
install: $(DOTFILE_DST) install_ohmyzsh

.PHONY: uninstall
uninstall:
	rm $(DOTFILE_DST)

.PHONY: install_ohmyzsh
install_ohmyzsh:
	./install_ohmyzsh.sh

$(DOTFILE_DST): $(HOME)/%: $(shell pwd)/%
	mkdir -p $(@D)
	ln -s -f $< $@
