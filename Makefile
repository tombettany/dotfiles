CWD=$(shell pwd)

install: submodules vim git python js

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

js: .PHONEY
	ln -sf $(CWD)/python/jshintrc ~/.jshintrc

tmux: .PHONEY
	ln -sf $(CWD)/tmux/tmux.conf ~/.tmux.conf

.PHONEY:
