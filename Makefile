.PHONY: aerospace alacritty bin brew check deps dunst font i3 linux mac mako nvim sketchybar spotify sway tmux waybar x zsh

brew:
	brew bundle

# Bootstrap external dependencies not managed by symlinks or brew
deps:
	[ -d ${HOME}/.oh-my-zsh ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh
	[ -d ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	[ -d ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	[ -d ${HOME}/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

aerospace:
	ln -fs $(CURDIR)/aerospace/aerospace.toml ${HOME}/.aerospace.toml

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

i3:
	mkdir -p ${HOME}/.config/i3
	mkdir -p ${HOME}/.config/i3status
	# add aliases for i3
	ln -fs $(CURDIR)/i3/config ${HOME}/.config/i3/config
	ln -fs $(CURDIR)/i3/i3status ${HOME}/.config/i3status/config

linux: deps alacritty bin dunst font i3 mako nvim spotify sway tmux waybar x zsh

mac: brew deps aerospace alacritty nvim sketchybar tmux zsh

mako:
	mkdir -p ${HOME}/.config/mako
	# add alias for mako
	ln -fs $(CURDIR)/mako/config ${HOME}/.config/mako/config

nvim:
	mkdir -p ${HOME}/.config/nvim
	ln -fs $(CURDIR)/nvim/lua ${HOME}/.config/nvim/
	ln -fs $(CURDIR)/nvim/init.lua ${HOME}/.config/nvim/init.lua
	ln -fs $(CURDIR)/nvim/lazy-lock.json ${HOME}/.config/nvim/lazy-lock.json

sketchybar:
	mkdir -p ${HOME}/.config/sketchybar
	ln -fs $(CURDIR)/sketchybar/sketchybarrc ${HOME}/.config/sketchybar/sketchybarrc
	ln -fs $(CURDIR)/sketchybar/plugins ${HOME}/.config/sketchybar

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

check:
	@ok=0; fail=0; \
	check() { \
	  if [ -L "$$2" ] && [ "$$(readlink $$2)" = "$$1" ]; then \
	    echo "  ok  $$2"; ok=$$((ok+1)); \
	  elif [ -e "$$2" ]; then \
	    echo "  BAD $$2 -> $$(readlink $$2  2>/dev/null || echo '(not a symlink)')"; fail=$$((fail+1)); \
	  else \
	    echo "  --  $$2 (missing)"; fail=$$((fail+1)); \
	  fi; \
	}; \
	check $(CURDIR)/aerospace/aerospace.toml ${HOME}/.aerospace.toml; \
	check $(CURDIR)/alacritty/alacritty.toml ${HOME}/.config/alacritty/alacritty.toml; \
	check $(CURDIR)/alacritty/catppuccin/catppuccin-mocha.toml ${HOME}/.config/alacritty/catppuccin/catppuccin-mocha.toml; \
	check $(CURDIR)/nvim/lua ${HOME}/.config/nvim/lua; \
	check $(CURDIR)/nvim/init.lua ${HOME}/.config/nvim/init.lua; \
	check $(CURDIR)/nvim/lazy-lock.json ${HOME}/.config/nvim/lazy-lock.json; \
	check $(CURDIR)/sketchybar/sketchybarrc ${HOME}/.config/sketchybar/sketchybarrc; \
	check $(CURDIR)/sketchybar/plugins ${HOME}/.config/sketchybar/plugins; \
	check $(CURDIR)/tmux/tmux.conf ${HOME}/.tmux.conf; \
	check $(CURDIR)/zsh/zprofile ${HOME}/.zprofile; \
	check $(CURDIR)/zsh/zshrc ${HOME}/.zshrc; \
	echo ""; echo "$$ok ok, $$fail failed"
