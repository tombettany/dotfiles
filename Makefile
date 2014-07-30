CWD=$(shell pwd)

install: submodules vim git python

submodules:
	git submodule init
	git submodule update --remote

vim:
	ln -s $(CWD)/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

git:
	ln -s $(CWD)/git/gitconfig ~/.gitconfig

python:
	ln -s $(CWD)/python/pylintrc ~/.pylintrc
