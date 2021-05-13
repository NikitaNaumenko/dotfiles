nvim-setup:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/nvim/lua
	mkdir -p ~/.config/nvim/lua/plugins
	mkdir -p ~/.config/nvim/lua/lsp
	mkdir -p ~/.config/nvim/lua/lsp/servers
	ln -s $(PWD)/files/vim/init.lua ~/.config/nvim/init.lua | true
	ln -s $(PWD)/files/vim/lua/settings.lua ~/.config/nvim/lua/settings.lua | true
	ln -s $(PWD)/files/vim/lua/mappings.lua ~/.config/nvim/lua/mappings.lua | true
	ln -s $(PWD)/files/vim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua | true
	ln -s $(PWD)/files/vim/lua/plugins/treesitter.lua ~/.config/nvim/lua/plugins/treesitter.lua | true
	ln -s $(PWD)/files/vim/lua/plugins/lualine.lua ~/.config/nvim/lua/plugins/lualine.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/init.lua ~/.config/nvim/lua/lsp/init.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/commands.lua ~/.config/nvim/lua/lsp/commands.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/on_attach.lua ~/.config/nvim/lua/lsp/on_attach.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/settings.lua ~/.config/nvim/lua/lsp/settings.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/servers/solargraph.lua ~/.config/nvim/lua/lsp/servers/solargraph.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/servers/tsserver.lua ~/.config/nvim/lua/lsp/servers/tsserver.lua | true
	ln -s $(PWD)/files/vim/lua/lsp/servers/gopls.lua ~/.config/nvim/lua/lsp/servers/gopls.lua | true
	# nvim -i NONE -c PackerInstall -c quitall
