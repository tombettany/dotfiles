CWD=$(shell pwd)

install: submodules vim git python js

submodules:
	git submodule init
	git submodule update --remote

vim: .PHONEY
	ln -sf $(CWD)/vim ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

# FIXME: Fails if vim version is too low
you-complete-me: .PHONEY
	cd vim/bundle/YouCompleteMe && \
	./install.py --clang-completer --omnisharp-completer --gocode-completer

neovim-python-support: .PHONEY
	sudo pip install neovim

neovim: .PHONEY you-complete-me neovim-python-support
	mkdir -p ~/.config/nvim
	ln -sf $(CWD)/vim/* ~/.config/nvim/
	ln -sf $(CWD)/vim/vimrc ~/.config/nvim/init.vim

git: .PHONEY
	ln -sf $(CWD)/git/gitconfig ~/.gitconfig

python: .PHONEY
	ln -sf $(CWD)/python/pylintrc ~/.pylintrc

js: .PHONEY
	ln -sf $(CWD)/python/jshintrc ~/.jshintrc

tmux: .PHONEY
	ln -sf $(CWD)/tmux/tmux.conf ~/.tmux.conf

.PHONEY:
