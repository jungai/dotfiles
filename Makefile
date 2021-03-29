clean:
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -f ~/.config/starship.toml
	rm -f ~/.zshrc

sync:
	ln -s $(shell pwd)/vim/.vimrc ~/.vimrc
	ln -s $(shell pwd)/zsh/.m1.zshrc ~/.zshrc
	ln -s $(shell pwd)/zsh/starship.tm ~/.config/starship.toml
	ln -s $(shell pwd)/tmux/.tmux.conf ~/.tmux.conf

ins:
	make clean
	make sync

.PHONY: all
