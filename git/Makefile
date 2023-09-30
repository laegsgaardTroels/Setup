GITDIR ?= ~/Git
OWNER ?= laegsgaardTroels

.PHONY: clone
all: gitrepos.txt
	mkdir -p $(GITDIR) && cd $(GITDIR); \
		mkdir -p $(OWNER) && cd $(OWNER); \
		for repo_url in $(shell cat gitrepos.txt); do \
			git clone $$repo_url; \
			done;

.PHONY:
clean:
	rm -rf $(OWNER)
	rm -f gitrepos.txt

gitrepos.txt:
	gh repo list --json sshUrl --jq ".[] | .sshUrl" $(OWNER) > $@
