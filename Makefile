install: vim

vim:
	ln -s ./vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	vim +PluginInstall +qall
