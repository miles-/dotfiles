.PHONY: all alacritty bin dunst font sway vim zsh

all: alacritty bin dunst font sway vim zsh

alacritty:
	mkdir -p ${HOME}/.config/alacritty
	ln -fs $(CURDIR)/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

bin:
	mkdir -p ${HOME}/bin
	# add aliases for things in bin
	ln -fs $(CURDIR)/bin/conky-swaybar ${HOME}/bin/conky-swaybar
	ln -fs $(CURDIR)/bin/bat_icon.sh ${HOME}/bin/bat_icon.sh
	ln -fs $(CURDIR)/bin/spotify-nowplaying.sh ${HOME}/bin/spotify-nowplaying.sh
	ln -fs $(CURDIR)/bin/weather.sh ${HOME}/bin/weather.sh

dunst:
	mkdir -p ${HOME}/.config/dunst
	# add alias for dunst
	ln -fs $(CURDIR)/dunst/dunstrc ${HOME}/.config/dunst/dunstrc

font:
	mkdir -p ${HOME}/.config/fontconfig
	ln -fs $(CURDIR)/font/fonts.conf ${HOME}/.config/fontconfig/fonts.conf

sway:
	mkdir -p ${HOME}/.config/sway
	ln -fs $(CURDIR)/sway/conkyrc ${HOME}/.conkyrc
	ln -fs $(CURDIR)/sway/config ${HOME}/.config/sway/config

vim:
	mkdir -p ${HOME}/.vim
	# add aliases for vim
	ln -fs $(CURDIR)/vim/vimrc ${HOME}/.vimrc
	ln -sfn $(CURDIR)/vim/autoload/ ${HOME}/.vim/
	ln -sfn $(CURDIR)/vim/bundle/ ${HOME}/.vim/
	ln -sfn $(CURDIR)/vim/colors/ ${HOME}/.vim/

zsh:
	# add aliases for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
