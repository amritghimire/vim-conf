# vim-conf

Vim configuration file with lots of improved features and mappings that will help you be productive while coding.

## Basic settings
- Leader key - " , " (comma)
- ColorScheme - GruvBox

### Plugins Used
- Plugin Manager - [Vundle](https://github.com/VundleVim/Vundle.vim)
- Syntax Checking - [Syntastic](https://github.com/vim-syntastic/syntastic)
- Files - [NerdTree](https://github.com/scrooloose/nerdtree)
- Color Scheme - [GruvBox](https://github.com/morhetz/gruvbox)
- Code Formatting - [Preetier](https://github.com/prettier/vim-prettier)
- Graphical Undo - [Gundo](https://github.com/sjl/gundo.vim)
- Searching - [Ag](https://github.com/rking/ag.vim)
- Code Completion - [YouCompleteMe](https://valloric.github.io/YouCompleteMe/)
- PEP8 - [Flake8](https://github.com/nvie/vim-flake8)
- Status Line - [airline vim](https://github.com/vim-airline/vim-airline)
- Git - [Fugitive](https://github.com/tpope/vim-fugitive)
- Emmet - [Emmet vim](https://github.com/mattn/emmet-vim)
- Easy Alignment - [VimEasyAlign](https://github.com/junegunn/vim-easy-align)
- File Buffer - [ctrlp](https://github.com/kien/ctrlp.vim) (TO REPLACE)
- Ultimate Snippet - [ultisnips](https://github.com/sirver/UltiSnips)
- Vim Snippet [vim-snippets](https://github.com/honza/vim-snippets)
- Intellisenese [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- Show Git diff [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)


#### others
- [Auto Pairs](https://github.com/jiangmiao/auto-pairs)

### Shortcuts
- `<F5>` - Show whitespace characters(eol, space, trail, etc.)
- `<space>` - Toggle code folding
- `<leader>s` - Save session
- `<leader>a` - Call Ag (silver searcher for searching)
- `<leader>t` - Nerdtree toggle
- `<leader>u` - Gundo toggle
- `<leader>n` - Toggle Relative line number
- `<leader>w` - Strip trailing whitespaces
- `z/` - Toggle Highlight all occurences of word currently under cursor

## Installation

- Install git<br/>
  Get the specific package for your system from [here](https://git-scm.com/downloads) and install

- Install vundle<br/>
  `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

- Now clone this file<br/>
  `git clone https://github.com/dpakach/vim-conf ~/vim-conf && ln -s ~/vim-conf/.vimrc ~/.vimrc`

- Install all the plugins<br/>
  To install all the plugins used in this .vimrc file:
  - open your terminal
  - open vim by typing typing `vim` and pressing enter
    you might get some errors at first, ignore them for now
  - run `:PluginInstall` in vim
  - to run form terminal type `vim +PluginInstall +qall`

Or run the following command after installing git
  ``` bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && git clone https://github.com/dpakach/vim-conf ~/vim-conf && ln -s ~/vim-conf/.vimrc ~/.vimrc && vim +PluginInstall +qall
```

