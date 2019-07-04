nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/vim/init.vim ~/.config/nvim/init.vim | true
	ln -s $(PWD)/vim/coc-settings.json ~/.config/nvim/coc-settings.json | true
