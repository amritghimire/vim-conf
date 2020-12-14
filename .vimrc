set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')
"
" -------------------------------
" PLUGINS
" -----------------------------
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier'
Plug 'vim-scripts/undotree.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'ycm-core/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'wakatime/vim-wakatime'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

filetype plugin indent on

" Basic

let mapleader=","       		" leader is comma
syntax on				" syntax highlight
let python_highlight_all=1		" python hightlight
set nu					" line numbers
set clipboard=unnamed			" for using system clipboard
set noswapfile
set incsearch
set hlsearch
set wildmenu
set showcmd
set number relativenumber
set eol
set backspace=indent,eol,start

" Enable Folding
set foldmethod=indent
set foldlevel=99

" Encoding
set encoding=utf-8

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" -------------------------------
" MAPPINGS
" -------------------------------
"
" Move between splits with ctrl+movement-keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" Show whitespaces as characters
set listchars=tab::-,trail:~,extends:>,precedes:<
set list
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" save session
nnoremap <leader>s :mksession<CR>

" open Ack.vim
nnoremap <leader>a :Ack! 

" Open zsh shell
nnoremap <leader>z :!zsh<cr>

"Goyo 
nnoremap <silent> <leader>d :Goyo<cr>

" Yank Stack 
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Linter
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ['autopep8', 'yapf', 'isort', 'black', 'remove_trailing_lines'], 'java': ['uncrustify','google_java_format']}
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint',  'pyls']}
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

nnoremap <leader>f :PrettierAsync<cr>
nnoremap <leader>i :ALEFix<cr>

"" -------------------------------
" LANGUAGE SPECIFIC SETTINGS
" -------------------------------
"
" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag white spaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
    \ match SpellBad /\s\+$/

" -------------------------------
" PLUGINS/BUNDLES settings
" -------------------------------
"
" you complete me settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:preview_markdown_vertical=1
let g:preview_markdown_auto_update=1

" nerdetree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeQuitOnOpen=1            " auto close nerdtree when new tab is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" synstatic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python'
let g:pymode_python = 'python3'

set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ctrlp settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_switch_buffer = 0
nnoremap <leader>ct :CtrlP<cr>
nnoremap <leader>cb :CtrlPBuffer<cr>
nnoremap <leader>cr :CtrlPMRU<cr>
nnoremap <leader>cm :CtrlPMixed<cr>

" colorscheme settings
set t_Co=256
set background=dark
colorscheme PaperColor

" gundo settings
nnoremap <leader>u :UndotreeToggle<CR>			" toggle gundo

" emmet settings
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'    "enable all function in all mode.


" Some Shortcuts

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
vnoremap <silent> <leader>r <Plug>(ale-rename)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"-------------------------------
" CUSTOM FUNCTIONS
" -------------------------------
" toggle between number and relativenumber
nnoremap <leader>n :call ToggleNumber()<CR>
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
nnoremap <leader>x :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" virtual tabstops using spaces
set shiftwidth=2
set softtabstop=0
set noexpandtab
" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set softtabstop=0
    set noexpandtab
  else
    set softtabstop=2
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z
call TabToggle()


set undofile
set smartcase
set ignorecase
set foldcolumn=2
