.PHONY: dot build-install-linux test-install-linux install-linux
# .PHONY: dot clean sync

# clean:
# 	rm -f ~/.vimrc
# 	rm -f ~/.tmux.conf
# 	rm -f ~/.config/starship.toml
# 	rm -f ~/.zshrc

# sync:
# 	ln -s $(shell pwd)/vim/.vimrc ~/.vimrc
# 	ln -s $(shell pwd)/zsh/.m1.zshrc ~/.zshrc
# 	ln -s $(shell pwd)/zsh/starship.toml ~/.config/starship.toml
# 	ln -s $(shell pwd)/tmux/.tmux.conf ~/.tmux.conf

# dot:
# 	make clean
# 	make sync

build-install-linux:
	docker build -t build-install-linux -f Dockerfile.linux .

test-install-linux:
	docker run -it build-install-linux /bin/sh

install-linux:
	./install_linux.mjs

dot:
	./index.mjs
	
