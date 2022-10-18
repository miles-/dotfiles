.PHONY: all alacritty bin font mako nvim spotify sway tmux waybar zsh

all: alacritty bin font mako nvim spotify sway tmux waybar zsh

alacritty:
	mkdir -p ${HOME}/.config/alacritty
	mkdir -p ${HOME}/.config/alacritty/catppuccin
	ln -fs $(CURDIR)/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml
	ln -fs $(CURDIR)/alacritty/catppuccin/catppuccin-mocha.yml ${HOME}/.config/alacritty/catppuccin/catppuccin-mocha.yml

bin:
	mkdir -p ${HOME}/bin
	# add aliases for things in bin
	ln -fs $(CURDIR)/bin/bat_icon.sh ${HOME}/bin/bat_icon.sh
	ln -fs $(CURDIR)/bin/spotify-nowplaying.sh ${HOME}/bin/spotify-nowplaying.sh
	ln -fs $(CURDIR)/bin/weather.sh ${HOME}/bin/weather.sh
	ln -fs $(CURDIR)/bin/record_sound.sh ${HOME}/bin/record_sound.sh

mako:
	mkdir -p ${HOME}/.config/mako
	# add alias for mako
	ln -fs $(CURDIR)/mako/config ${HOME}/.config/mako/config

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

spotify:
	ln -fs $(CURDIR)/spotify/config.yml ${HOME}/.config/spotify-tui/config.yml

sway:
	mkdir -p ${HOME}/.config/sway
	ln -fs $(CURDIR)/sway/config ${HOME}/.config/sway/config

tmux:
	ln -fs $(CURDIR)/tmux/tmux.conf ${HOME}/.tmux.conf

waybar:
	mkdir -p ${HOME}/.config/waybar
	ln -fs $(CURDIR)/sway/waybar/config ${HOME}/.config/waybar/config
	ln -fs $(CURDIR)/sway/waybar/mocha.css ${HOME}/.config/waybar/mocha.css
	ln -fs $(CURDIR)/sway/waybar/style.css ${HOME}/.config/waybar/style.css

zsh:
	# add aliases for zsh
	ln -fs $(CURDIR)/zsh/zprofile ${HOME}/.zprofile
	ln -fs $(CURDIR)/zsh/zshrc ${HOME}/.zshrc
