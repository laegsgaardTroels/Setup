# A list of the dotfiles one wish to create a symbolic link to from $(HOME)
DOTFILES := .aliases .gitconfig .vimrc
DOTFILE_DST := $(DOTFILES:%=$(HOME)/%)

.PHONY: install
install: $(DOTFILE_DST)

.PHONY: uninstall
uninstall:
	rm $(DOTFILE_DST)

$(DOTFILE_DST): $(HOME)/%: $(shell pwd)/%
	ln -s -f $< $@
