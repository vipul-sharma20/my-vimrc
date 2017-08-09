my-vimrc
========

This is the vimrc I use on my machine. Please feel free to give some suggestions.

I use same configuration for neovim


Getting VIM / Neovim
--------------------
* Building VIM from source: [gist](https://gist.github.com/vipul-sharma20/e45a182de5ec9dad652db613d0620080)
* Neovim:
    * `brew install neovim`
    * `pip install neovim` (python support for plugins using python like YCM)

Using vimrc with Neovim
-----------------------
* `~/.config/nvim/init.vim`

    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.vimrc
