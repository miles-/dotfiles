.PHONY: all bin i3 dunst vim x zsh

all: bin i3 dunst vim x zsh

bin:
	mkdir -p ${HOME}/bin
	# add aliases for things in bin
	ln -fs $(CURDIR)/bin/conky-i3bar ${HOME}/bin/conky-i3bar
	ln -fs $(CURDIR)/bin/bat_icon.sh ${HOME}/bin/bat_icon.sh
	ln -fs $(CURDIR)/bin/spotify-nowplaying.sh ${HOME}/bin/spotify-nowplaying.sh
	ln -fs $(CURDIR)/bin/weather.sh ${HOME}/bin/weather.sh

i3:
	mkdir -p ${HOME}/.config/i3
	# add aliases for i3
	ln -fs $(CURDIR)/i3/conkyrc ${HOME}/.conkyrc
	ln -fs $(CURDIR)/i3/config ${HOME}/.config/i3/config

dunst:
	mkdir -p ${HOME}/.config/dunst
	# add alias for dunst
	ln -fs $(CURDIR)/dunst/dunstrc ${HOME}/.config/dunst/dunstrc

vim:
	mkdir -p ${HOME}/.vim
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
	sudo ln -fs $(CURDIR)/x/xorg.conf /etc/X11/xorg.conf

zsh:
	# add aliases for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
