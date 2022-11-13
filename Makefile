nvim-setup:
	ln -s $(PWD)/files/vim/* ~/.config/nvim/ | true
	# nvim -i NONE -c PackerInstall -c quitall
	# nvim -i NONE -c PackerCompile -c quitall
term-setup:
	ln -s $(PWD)/files/term/alacritty.yml ~/.config/alacritty/alacritty.yml | true
	ln -s $(PWD)/files/term/github.yml ~/.config/alacritty/github.yml | true
	ln -s $(PWD)/files/term/.tmux.conf ~/.tmux.conf | true
	ln -s $(PWD)/files/term/.gitconfig ~/.gitconfig | true
	ln -s $(PWD)/files/term/.zshrc ~/.zshrc | true
