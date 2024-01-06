.PHONY: all alacritty bin dunst font i3 mako nvim spotify sway tmux waybar x zsh

all: alacritty bin dunst font i3 mako nvim spotify sway tmux waybar x zsh

alacritty:
	mkdir -p ${HOME}/.config/alacritty
	mkdir -p ${HOME}/.config/alacritty/catppuccin
	ln -fs $(CURDIR)/alacritty/alacritty.toml ${HOME}/.config/alacritty/alacritty.toml
	ln -fs $(CURDIR)/alacritty/catppuccin/catppuccin-mocha.toml ${HOME}/.config/alacritty/catppuccin/catppuccin-mocha.toml

bin:
	mkdir -p ${HOME}/bin
	# add aliases for things in bin
	ln -fs $(CURDIR)/bin/bat_icon.sh ${HOME}/bin/bat_icon.sh
	ln -fs $(CURDIR)/bin/conky-i3bar ${HOME}/bin/conky-i3bar
	ln -fs $(CURDIR)/bin/record_sound.sh ${HOME}/bin/record_sound.sh
	ln -fs $(CURDIR)/bin/spotify-nowplaying.sh ${HOME}/bin/spotify-nowplaying.sh
	ln -fs $(CURDIR)/bin/weather.sh ${HOME}/bin/weather.sh

dunst:
	mkdir -p ${HOME}/.config/dunst
	# add alias for dunst
	ln -fs $(CURDIR)/dunst/dunstrc ${HOME}/.config/dunst/dunstrc

font:
	mkdir -p ${HOME}/.config/fontconfig
	ln -fs $(CURDIR)/font/fonts.conf ${HOME}/.config/fontconfig/fonts.conf

mako:
	mkdir -p ${HOME}/.config/mako
	# add alias for mako
	ln -fs $(CURDIR)/mako/config ${HOME}/.config/mako/config

i3:
	mkdir -p ${HOME}/.config/i3
	mkdir -p ${HOME}/.config/i3status
	# add aliases for i3
	ln -fs $(CURDIR)/i3/config ${HOME}/.config/i3/config
	ln -fs $(CURDIR)/i3/i3status ${HOME}/.config/i3status/config

nvim:
	mkdir -p ${HOME}/.config/nvim
	ln -fs $(CURDIR)/nvim/lua ${HOME}/.config/nvim/
	ln -fs $(CURDIR)/nvim/after ${HOME}/.config/nvim/
	ln -fs $(CURDIR)/nvim/init.lua ${HOME}/.config/nvim/init.lua

spotify:
	ln -fs $(CURDIR)/spotify/config.yml ${HOME}/.config/spotify-tui/config.yml

sway:
	mkdir -p ${HOME}/.config/sway
	ln -fs $(CURDIR)/sway/config ${HOME}/.config/sway/config

tmux:
	ln -fs $(CURDIR)/tmux/tmux.conf ${HOME}/.tmux.conf

waybar:
	mkdir -p ${HOME}/.config/waybar
	ln -fs $(CURDIR)/waybar/config ${HOME}/.config/waybar/config
	ln -fs $(CURDIR)/waybar/mocha.css ${HOME}/.config/waybar/mocha.css
	ln -fs $(CURDIR)/waybar/style.css ${HOME}/.config/waybar/style.css

x:
	# add aliases for X
	ln -fs $(CURDIR)/x/Xresources ${HOME}/.Xresources
	ln -fs $(CURDIR)/x/xinitrc ${HOME}/.xinitrc
	sudo ln -fs $(CURDIR)/x/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

zsh:
	# add aliases for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
