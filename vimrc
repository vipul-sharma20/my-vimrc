" to start pathogen
let g:pathogen_disabled = ['jedi-vim', 'taglist', 'nvim-completion-manager']
execute pathogen#infect()

syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'shime/vim-livedown'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'easymotion/vim-easymotion'
Plugin 'mkitt/tabline.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/vim-cursorword'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3


set ignorecase

"NerdTree ignoring files
let NERDTreeIgnore = ['\.pyc$']


"easymotion settings
map / <Plug>(easymotion-sn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" bffergator settings
:set hidden
:nnoremap \q :BuffergatorOpen<CR>
:nnoremap [b :BuffergatorMruCyclePrev<CR>
:nnoremap ]b :BuffergatorMruCycleNext<CR>
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_sort_regime = "mru"
let g:buffergator_show_full_directory_path = 0
let g:buffergator_tab_statusline = 0
let g:buffergator_window_statusline = 0
let g:buffergator_autodismiss_on_select = 1
let g:buffergator_autoupdate = 1
let g:buffergator_mru_cycle_loop = 1


" chosen colorscheme for vim and airline
" :colorscheme Tomorrow-Night
:colorscheme gruvbox

let g:gruvbox_contrast_dark='soft'
set bg=dark
highlight clear SignColumn
highlight clear Folded

" :let g:airline_theme='dark'


" settings for the vim-jsdoc plugins
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return = 1
let g:jsdoc_return_type = 1
let g:jsdoc_return_description = 1


" setting ale plugin
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
let g:ale_filetype_blacklist = ['qf', 'tags', 'unite', 'terminal', 'term']
let g:ale_sign_column_always = 1
let b:ale_linters = {'python': ['yapf']}
let b:ale_fixers = ['autopep8']
nnoremap <F8> :ALEFix<CR>

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" settings for the indentLine and indentGuide plugins
set ts=4 sw=4 et
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=grey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indentLine_char = '┆'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" airline settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" autocomplpop settings
let g:acp_enableAtStartup = 0
let g:acp_ignorecaseOption = 0

" deoplete settings
" let g:deoplete#enable_at_startup = 1

" YCM config
let g:loaded_python_provider=1
let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_path_to_python_interpreter = '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_key_invoke_completion = '<C-c>'


"  syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" mappings & settings for split-term plugin
set splitright
set splitbelow
nnoremap -D :call ToggleTerm()<CR>

" settings for taglist
nnoremap -L :call ToggleTagbar()<CR>
let g:tagbar_autoclose = 0
let g:tagbar_left = 0
let g:tagbar_compact = 1
let g:tagbar_indent = 2
let g:tagbar_show_linenumber = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0


" mappings & settins for tagbar
let Tlist_Auto_Highlight_Tag = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Use_Right_Window = 1

" to fix Yanking and system clipboard problem
" basically a combination of two workarounds
" https://github.com/neovim/neovim/issues/583#issuecomment-40942281
" and
" https://github.com/neovim/neovim/issues/583#issuecomment-43196619
" function! ClipboardYank()
"   call system('xclip -i -selection clipboard', @@)
" endfunction
" function! ClipboardPaste()
"   let @@ = system('xclip -o -selection clipboard')
" endfunction
" 
" vnoremap <silent> y y:call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>
" onoremap <silent> y y:call ClipboardYank()<cr>
" onoremap <silent> d d:call ClipboardYank()<cr>

"highlight `TODO`
:highlight CustomHighlightGroup ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
:match CustomHighlightGroup /TODO\|FIXME/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""methods

function! LoopColorScheme()
    let path = split(globpath('~/.vim/bundle/vim-colorschemes/colors/','*'), "\n")
    echo "hh"
    for fl in path
        sleep 500m
        let fl = substitute(fl, "^\/.*\/", "", "g")
        let fl = substitute(fl, ".vim$", "", "g")
        execute ':colorscheme ' . fl . ' | :redraw!'
        execute ':echo ' . fl
        sleep 4000m
    endfor
endfunction


function! AddGitTemplateAddition()
    execute ':1'
    let cPut=search('^\# Please enter the.*') - 1
    let cStart=search('^\# Changes to be committed:$') + 1
    let cEnd=search('^\#$')
    execute ':1'
    if cPut >= 0 && cEnd >= cStart && cStart >= 0
        execute ':echo ' . cStart . " " . cEnd
        execute ':'. cStart . ',' . cEnd . 's/^\#\s//'
        execute ':' . cStart . ',' . cEnd . 'm ' . cPut
        let cPut = cPut-1
        execute ':' . cPut
        execute ':normal zxzx-RI'
    endif
endfunction

function! ToggleTerm()
    if bufwinnr('term') > 0
        exe bufwinnr('term') . "windo -" . "exit"
    else
        exe "10Term"
    endif
endfunction

function! ToggleTagbar()
    if bufwinnr('Tagbar') > 0
        exe bufwinnr('Tagbar') . "windo -" . "exit"
    else
        exe "Tagbar"
    endif
endfunction

" To restore the split size and shape when moving between
" different (zoomed) split configurations and others
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
function! MaximizeToggle()
    if exists("s:maximize_session")
        let s:maximize_current_buf_name=@%
        exec "source " . s:maximize_session
        if exists("s:maximize_nerd_exists")
            if bufwinnr('NERD') < 0
                exec "NERDTreeToggle"
            endif
            unlet s:maximize_nerd_exists
        endif
        if exists("s:maximize_tagbar_exists")
            if bufwinnr('Tagbar') < 0
                exec "Tagbar"
            endif
            unlet s:maximize_tagbar_exists
        endif
        if bufwinnr('term') > 0
            exe bufwinnr('term') . "resize 10"
            exe bufwinnr('term') . "windo setlocal number!"
            wincmd p
        endif
        exec bufwinnr(s:maximize_current_buf_name) . "windo -"
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        if bufwinnr('NERD') > 0
            let s:maximize_nerd_exists=""
            exec "NERDTreeToggle"
        endif
        if bufwinnr('Tagbar') > 0
            let s:maximize_tagbar_exists=""
            exec "TagbarClose"
        endif
        set sessionoptions-=tabpages
        exec "mksession! " . s:maximize_session
        set sessionoptions+=tabpages
        only
    endif
endfunction


"" Helping with ctags very simple for now
function! GenCtags ()
    !ctags -R
    echo getcwd()
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""other config

"to make vim show current filename
set laststatus=2

:set wildmenu
"to enable auto sysntax highlighting by enabling auto detection of file type
filetype on

"to autoindent the next line
set autoindent

"to make the backspace key work
set backspace=indent,eol,start

"this line makes vim search for tag folder recursively till the /
set tags=./tags;/,tags;/


"To get the shell command output in a buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"Command to setup things while commenting code or commit messages
:command Comment :set spell! spelllang=en_us | :set cc=72
:command Commit :set spell! spelllang=en_us | :set cc=72 | silent :call AddGitTemplateAddition()
:command GC :R git diff --cached

"Compile the current cpp file
:command CC execute 'silent ! g++ -DDEBUG %:t -o %:t.out 2>output.txt 1>output.txt' | execute ':redraw!'
:command Run execute 'silent ! ./%:t.out 1>output.txt 2>output.txt < input.txt' | execute ':redraw!'

:command CachedDiff :Commit | :R 'git diff --cached' | :set cc=0 | :set spell! spelllang=en_us

"adding other options
set pastetoggle=<F5>
set number

map -S :set spell! spelllang=en_us<CR>
nnoremap -N : setlocal number!<CR>
nnoremap -CS :LinuxCodingStyle<CR>
nnoremap -CL :%s/\s\+$//<CR>
map -tb1 <C-W><T>:Tabmerge 1<CR>
nnoremap zx o<ESC>
nnoremap -tb2 <C-W><T>:Tabmerge 2<CR>
nnoremap -tb3 <C-W><T>:Tabmerge 3<CR>
set clipboard=unnamed
nnoremap Y "+y
nnoremap P "+p

"tabline.vim settings
hi TabLine ctermfg=Black ctermbg=Grey cterm=NONE
hi TabLineFill ctermfg=Black ctermbg=Grey cterm=NONE
hi TabLineSel ctermfg=White ctermbg=DarkBlue cterm=NONE

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline,bold cterm=underline,bold
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline,bold
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline,bold
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline,bold

"Highlight cursor line
"Do not set, as it slows vim down
"set cursorline

"mappings to make vim and tmux split navigation same"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"To map nerd tree toggle command
nnoremap -B :NERDTreeToggle<CR>
nnoremap -BC :NERDTreeMirror<CR>

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


"binding to input 'TIME TAKEN' and 'Relevant Issue' stamp
nnoremap -TT iTIME TAKEN :   hours<ESC>7h i
nnoremap -RI iRelevant Issue #
"Earlier -TD use to print TO-DO, so in older projects, search for TO-DO insted.
nnoremap -TD i#// TODO :
" To automatically add the modified file list when using 'git commit -v'
"nnoremap -MF iModified Files:<ESC>I<ESC>5j

autocmd BufNewFile *.cpp :r! sed -n 'p' < ~/Desktop/snck/.cpp.template
"Do not set, as it slows vim down
"autocmd InsertLeave * :set cul! | :redraw!
"autocmd InsertEnter * :set cul! | :redraw!
set smartindent

let g:new_buf_bash = 0
let g:buf_enter_bash = 0
let g:enter_cmd_win = 0


"Settings to make netrw more usable
"PS : Its a really good feature
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_preview = 1

"To prevent vim_markdown_preview plugin from misbehaving
let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1

" Mouse
set mouse=nicr

" GitGutter config
let g:gitgutter_realtime = 1
set updatetime=100

" column marker
if exists('+colorcolumn')
      set colorcolumn=80
else
      au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Cursorline
set cursorline

" Enable folding
set foldmethod=indent

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Highlight bad whitespace
highlight ws ctermbg=yellow guibg=yellow
match ws /\s\+$/
autocmd BufWinEnter * match ws / \+$/

set wildignorecase

" Jsonify
:command Json %!python -m json.tool

set encoding=utf-8

set iskeyword-=_

