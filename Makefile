.PHONY: all alacritty bin dunst font sway nvim zsh

all: alacritty bin dunst font nvim sway zsh

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
	ln -fs $(CURDIR)/bin/record_sound.sh ${HOME}/bin/record_sound.sh

dunst:
	mkdir -p ${HOME}/.config/dunst
	# add alias for dunst
	ln -fs $(CURDIR)/dunst/dunstrc ${HOME}/.config/dunst/dunstrc

font:
	mkdir -p ${HOME}/.config/fontconfig
	ln -fs $(CURDIR)/font/fonts.conf ${HOME}/.config/fontconfig/fonts.conf

nvim:
	mkdir -p ${HOME}/.config/nvim
	mkdir -p ${HOME}/.config/nvim/lua
	ln -fs $(CURDIR)/nvim/init.lua ${HOME}/.config/nvim/init.lua
	ln -fs $(CURDIR)/nvim/plugins.lua ${HOME}/.config/nvim/lua/plugins.lua
	ln -fs $(CURDIR)/nvim/config.lua ${HOME}/.config/nvim/lua/config.lua
	ln -fs $(CURDIR)/nvim/lsp.lua ${HOME}/.config/nvim/lua/lsp.lua

sway:
	mkdir -p ${HOME}/.config/sway
	ln -fs $(CURDIR)/sway/conkyrc ${HOME}/.conkyrc
	ln -fs $(CURDIR)/sway/config ${HOME}/.config/sway/config

zsh:
	# add aliases for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
