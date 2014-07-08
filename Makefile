install: vim git

vim:
	ln -s ./vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

git:
	ln -s ~/git/gitconfig ~/.gitconfig
