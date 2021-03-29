clean:
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -f ~/.config/starship.toml
	rm -f ~/.zshrc

sync:
	ln -s $(PWD)/vim/.vimrc ~/.vimrc
	ln -s $(PWD)/zsh/.m1.zshrc ~/.zshrc
	ln -s $(PWD)/zsh/starship.tm ~/.config/starship.toml
	ln -s $(PWD)/tmux/.tmux.conf ~/.tmux.conf

ins:
	make clean
	make sync

.PHONY: all
