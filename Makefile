nvim-setup:
	ln -s $(PWD)/files/vim/* ~/.config/nvim/ | true
	# nvim -i NONE -c PackerInstall -c quitall
	# nvim -i NONE -c PackerCompile -c quitall
