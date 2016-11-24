.PHONY: all bin i3 tmux vim x zsh

all: bin i3 tmux vim x zsh

bin:
	mkdir -p ${HOME}/bin
	# add aliases for things in bin
	ln -fs $(CURDIR)/bin/conky-i3bar ${HOME}/bin/conky-i3bar

i3:
	mkdir -p ${HOME}/.config
	# add aliases for i3
	ln -fs $(CURDIR)/i3/conkyrc ${HOME}/.conkyrc
	ln -fs $(CURDIR)/i3/config ${HOME}/.config/i3/config

tmux:
	# add aliases for tmux
	ln -fs $(CURDIR)/tmux/tmux.conf ${HOME}/.tmux.conf

vim:
	# add aliases for vim
	ln -fs $(CURDIR)/vim/vimrc ${HOME}/.vimrc
	ln -sfn $(CURDIR)/vim/autoload/ ${HOME}/.vim/
	ln -sfn $(CURDIR)/vim/bundle/ ${HOME}/.vim/
	ln -sfn $(CURDIR)/vim/colors/ ${HOME}/.vim/

x:
	# add aliases for X
	ln -fs $(CURDIR)/x/Xdefaults ${HOME}/.Xdefaults
	ln -fs $(CURDIR)/x/xinitrc ${HOME}/.xinitrc
	sudo ln -fs $(CURDIR)/x/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf


zsh:
	# add alises for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
