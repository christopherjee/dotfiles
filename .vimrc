" open all files in argument list in tabs
tab all

" pathogen bundling plugin
call pathogen#infect()
syntax on
filetype plugin indent on

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
set hlsearch
set ignorecase
set smartcase
set autoindent
set number
set shiftwidth=4
set smartindent
set expandtab
set tabstop=4
set autoread
set backspace=indent,eol,start
set list
set listchars=tab:>.,trail:~,extends:>,precedes:<
set showmatch
set showtabline=2
set tw=0
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.php :%s/if(/if (/e
autocmd BufWritePre *.php :%s/foreach(/foreach (/e
vnoremap > >gv
vnoremap < <gv
nmap <c-l> :tabnew<CR>:tabm<CR><c-p>
nmap <c-n> :tabnew<CR><c-p>
nnoremap <c-b> <c-p><c-b>
cabbr <expr> %% expand('%:p:h')

" omniautocomplete
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
imap <c-c> <c-x><c-o>
set completeopt="menu"

" make it easier to search whole project
let g:searchword = ''
nmap <c-f> :tabnew<CR>:LAck<Space>''<left>
nmap <c-f><c-f> :let g:searchword = expand("<cword>")<CR>:tabnew<CR>:LAck <C-R>=string(g:searchword)<CR>

" TList stuff
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 40
" close tlist when a selection is made
let Tlist_Close_On_Select = 0
" make it easier to open list
nmap <c-t><c-l> :TlistToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=5
let g:syntastic_enable_signs = 1
let g:syntastic_phpcs_conf = "--standard=/home/".expand($USER)."/development/Web/tests/standards/stable-ruleset.xml"
let g:syntastic_mode_map = { 'mode' : 'passive',
                           \ 'active_filetypes' : [],
                           \ 'passive_filetypes' : [] }

" supertab
let g:SuperTabDefaultCompletionTypeDiscovery = [
            \ "&completefunc:<c-x><c-u>",
            \ "&omnifunc:<c-x><c-o>",
            \ ]
let g:SuperTabLongestHighlight = 1

" localvimrc
let g:localvimrc_sandbox = 0

" paste mode toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" tab toggle
au TabLeave * :let g:tabno = tabpagenr()
map gg :exec 'normal !'.g:tabno.'gt'<CR>

" current file
function! Pwf()
    execute "echo @%"
endfunction
command! -nargs=0  Pwf call Pwf()

" disable syntax highlighting for files over 100K
au BufReadPost * if getfsize(bufname("%")) > 102400 | set syntax= | endif

command! Blame !git blame %
