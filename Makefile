install: submodules vim git

submodules:
	git submodule init
	git submodule update

vim:
	ln -s ./vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

git:
	ln -s ~/git/gitconfig ~/.gitconfig
