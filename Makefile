all:
	mkdir -p ~/.config/nvim ~/.claude && \
		ln -s $$(readlink -f ./vimrc) ~/.config/nvim/init.vim && \
		ln -s $$(readlink -f ./coc-settings.json) ~/.config/nvim/coc-settings.json && \
		ln -s $$(readlink -f ./bash_profile) ~/.bash_profile && \
		ln -s $$(readlink -f ./tmux.conf) ~/.tmux.conf && \
		ln -s $$(readlink -f ./kitty) ~/.config/kitty && \
		ln -s $$(readlink -f ./lua) ~/.config/nvim/lua && \
		ln -s $$(readlink -f ./settings.json) ~/.claude/settings.json

