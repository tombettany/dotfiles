CWD=$(shell pwd)

install: submodules vim git python

submodules:
	git submodule init
	git submodule update --remote

vim:
	ln -sf $(CWD)/vim ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

git:
	ln -sf $(CWD)/git/gitconfig ~/.gitconfig

python:
	ln -sf $(CWD)/python/pylintrc ~/.pylintrc
