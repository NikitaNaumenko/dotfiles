nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vim/init.vim ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/vim/coc-settings.json ~/.config/nvim/coc-settings.json | true
