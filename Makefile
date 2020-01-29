all:
	ln -s $(readlink --canonicalize ./vimrc) ~/.vimrc && ln -s $(readlink --canonicalize ./bash_profile) ~/.bash_profile
