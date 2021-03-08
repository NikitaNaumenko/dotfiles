nvim-setup:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/nvim/lua
	ln -s $(PWD)/files/vim/init.vim ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/vim/lua/settings.lua ~/.config/nvim/lua/settings.lua | true
	ln -s $(PWD)/files/vim/lua/mappings.lua ~/.config/nvim/lua/mappings.lua | true
	ln -s $(PWD)/files/vim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua | true
	ln -s $(PWD)/files/vim/lua/lsp.lua ~/.config/nvim/lua/lsp.lua | true
	nvim -i NONE -c PackerInstall -c quitall
