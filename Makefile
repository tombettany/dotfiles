CWD=$(shell pwd)

install: submodules vim git python

submodules:
	git submodule init
	git submodule update --remote

vim: .PHONEY
	ln -sf $(CWD)/vim ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

git: .PHONEY
	ln -sf $(CWD)/git/gitconfig ~/.gitconfig

python: .PHONEY
	ln -sf $(CWD)/python/pylintrc ~/.pylintrc

.PHONEY:
