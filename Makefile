CWD=$(shell pwd)

install: submodules vim git python js

submodules:
	git submodule init
	git submodule update --remote

vim: .PHONEY
	ln -sf $(CWD)/vim ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall
	vim +"CocInstall coc-html coc-eslint coc-clang-format-style-options coc-tsserver coc-sql coc-sh coc-json coc-jedi coc-go coc-docker coc-cmake coc-graphql coc-texlab"

# FIXME: Fails if vim version is too low
you-complete-me: .PHONEY
	cd vim/bundle/YouCompleteMe && \
	./install.py --clang-completer --omnisharp-completer --gocode-completer

neovim-python-support: .PHONEY
	pip install neovim

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
	ln -sf $(CWD)/tmux ~/.tmux
	ln -sf ~/.tmux/tmux.conf ~/.tmux.conf

bash: .PHONEY
	ln -sf $(CWD)/bash/bash_profile ~/.bash_profile

tools: .PHONEY
	brew install go hashicorp/tap/terraform-ls
	go install golang.org/x/tools/gopls@latest

.PHONEY:
