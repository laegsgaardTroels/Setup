# A list of the dotfiles one wish to create a symbolic link to from $(HOME)
DOTFILES := .oh-my-zsh/custom/fzf.zsh .oh-my-zsh/custom/zaliases.zsh .gitconfig .config/nvim .pdbrc
DOTFILE_DST := $(DOTFILES:%=$(HOME)/%)

.PHONY: install
install: install_ohmyzsh $(DOTFILE_DST) 

.PHONY: uninstall
uninstall:
	rm $(DOTFILE_DST)

.PHONY: install_ohmyzsh
install_ohmyzsh:
	./install_ohmyzsh.sh

$(DOTFILE_DST): $(HOME)/%: $(shell pwd)/%
	mkdir -p $(@D)
	ln -s -f $< $@
