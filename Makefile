clean:
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -f ~/.config/starship.toml
	rm -f ~/.zshrc

sync:
	ln -s $(pwd)/vim/.vimrc ~/.vimrc
	ln -s $(pwd)/zsh/.m1.zshrc ~/.zshrc
	ln -s $(pwd)/zsh/starship.tm ~/.config/starship.toml
	ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

ins:
	make clean
	make sync

.PHONY: all
