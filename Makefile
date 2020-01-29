all:
	ln -s ~/.vimrc $(readlink --canonicalize ./vimrc) && ln -s ~/.bash_profile $(readlink --canonicalize ./bash_profile)
