# A list of the dotfiles one wish to create a symbolic link to from $(HOME)
DOTFILES := .aliases .gitconfig .config/nvim .pdbrc
DOTFILE_DST := $(DOTFILES:%=$(HOME)/%)

.PHONY: install
install: $(DOTFILE_DST) install_aliases install_ohmyzsh

.PHONY: uninstall
uninstall:
	rm $(DOTFILE_DST)
	cat $(HOME)/.zshrc | grep -wvE "source $(HOME)/.aliases" > $(HOME)/.zshrc


.PHONY: install_aliases
install_aliases:
	cat $(HOME)/.zshrc \
		| grep -qFx "source $(HOME)/.aliases" \
		|| echo "source $(HOME)/.aliases" >> $(HOME)/.zshrc

.PHONY: install_ohmyzsh
install_ohmyzsh:
	./install_ohmyzsh.sh

$(DOTFILE_DST): $(HOME)/%: $(shell pwd)/%
	mkdir -p $@
	ln -s -f $< $@
