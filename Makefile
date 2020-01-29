all:
	ln -s ~/.vimrc $(readlink -f ./vimrc) && ln -s ~/.bash_profile $(readlink -f ./bash_profile)
