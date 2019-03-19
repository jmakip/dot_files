all: build

update:
	mkdir -p ~/.config/nvim/
	mkdir -p ~/.config/alacritty/
	mkdir -p ~/.config/i3/
	mkdir -p ~/.config/termite/

#could change these to symlinks
	cp -R $(PWD)/config/nvim/. ~/.config/nvim/
	cp -R $(PWD)/config/alacritty/. ~/.config/alacritty/
	cp -R $(PWD)/config/i3/. ~/.config/i3/
	cp -R $(PWD)/config/termite/. ~/.config/termite/


clean:
	rm -rf ~/.config/nvim/
	rm -rf ~/.config/alacritty/
	rm -rf ~/.config/i3/
	rm -rf ~/.config/termite/


.PHONY: all clean update build
