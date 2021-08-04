# Vim

This file is based on {vim bootstrap](https://vim-bootstrap.com) and currently it's using
the lucario color scheme.

**NOTE**: Before moving this file, make sure to install Plug and the [lucario](https://github.com/raphamorim/lucario) color scheme, for neovim check this [link](https://github.com/junegunn/vim-plug#neovim)
and for vim [this](https://github.com/junegunn/vim-plug#vim) one.

## Plug neovim
``
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
``

## Lucario color scheme
``
mkdir ~/.vim/colors && \
wget https://raw.githubusercontent.com/raphamorim/lucario/master/colors/lucario.vim -O ~/.vim/colors/lucario.vim
``
