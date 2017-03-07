" Vipul Sharma .vimrc

set nocompatible              " required
set backspace=2              " required
filetype on                  " required
filetype plugin on
filetype plugin indent on    " required

" remove scroll bar
set guioptions-=r

" Copy to clipboard
vmap <C-c> "*y

" Paste mode in INSERT
set pastetoggle=<F10>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'dracula/vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" All of your Plugins must be added before the following line
call vundle#end()            " required

if has("gui_macvim")
  colorscheme dracula
  set fu
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tablast<CR>
else
    colorscheme gotham256
    let g:lightline = { 'colorscheme': 'gotham256' }
endif

" sv command split mode
set splitright

" Enable folding
set foldmethod=indent
" set foldlevel=8

" monitor realtime changes to a file
set autoread

" show docstrings for folded code
" let g:SimpylFold_docstring_preview=1

set tabstop=4
set shiftwidth=4
set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=4
        set noexpandtab
    el
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Wrap text after a certain number of characters
" Python: 79
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

" Making sure with encoding
set encoding=utf-8

" YCM config
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set line number
:set nu

" mouse scroll
:set mouse=nicr

" syntax highlighting
:syntax on
let python_highlight_all = 1

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" column marker
if exists('+colorcolumn')
      set colorcolumn=80
else
      au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Cursorline
set cursorline

" lightline
set laststatus=2

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Highlight bad whitespace
highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws / \+$/

" NERDTree config

" open NERDTree on startup
" autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0

" NERDTree git config
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
set guioptions-=L

" search highlight and toggle highlight
set hlsearch!
map <C-f> :set hlsearch!<CR>

" create/switch tabs
map <C-t> :tabnew<CR>

" Syntastic config
map <C-y> :SyntasticCheck<CR>
map <C-u> :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers= ['flake8']

" Conque shell config
map <C-s> :ConqueTermVSplit zsh<CR>

" Multicursor config
let g:multi_cursor_next_key='<C-c>'

" GitGutter config
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Custom commands

" Pretty JSON
:command Json %!python -m json.tool
