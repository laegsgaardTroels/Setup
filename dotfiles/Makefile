# A list of the dotfiles one wish to create a symbolic link to from $(HOME)
DOTFILES := .aliases .gitconfig .config/nvim
DOTFILE_DST := $(DOTFILES:%=$(HOME)/%)

.PHONY: install
install: $(DOTFILE_DST) install_aliases

.PHONY: uninstall
uninstall:
	rm $(DOTFILE_DST)
	cat $(HOME)/.zshrc | grep -wvE "source $(HOME)/.alias" > $(HOME)/.zshrc


.PHONY: install_aliases
install_aliases:
	cat $(HOME)/.zshrc \
		| grep -qFx "source $(HOME)/.alias" \
		|| echo "source $(HOME)/.alias" >> $(HOME)/.zshrc

$(DOTFILE_DST): $(HOME)/%: $(shell pwd)/%
	ln -s -f $< $@
