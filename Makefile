all:
	ln -s $$(readlink -f ./vimrc) ~/.vimrc && ln -s $$(readlink -f ./bash_profile) ~/.bash_profile
