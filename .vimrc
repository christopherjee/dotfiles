set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-liquid'
Plugin 'scrooloose/nerdtree'
Plugin 'k0kubun/vim-open-github'

call vundle#end()
syntax enable
filetype plugin indent on

" open all files in argument list in tabs
tab all

" command-t / ctrlp
nmap <c-l> :tabnew<CR>:tabm<CR><c-p>
nmap <c-n> :tabnew<CR><c-p>
" nnoremap <c-b> <c-p><c-b>
cabbr <expr> %% expand('%:p:h')

" ctrl-p
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
else
  let g:ctrlp_user_command = 'find %s -type f -not -path "*.class" -not -path "*.pyc" -not -path "*/tmp/*"'
  let g:ctrlp_use_caching = 1
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

syntax on
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
imap <S-Tab> <C-o><<
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.php :%s/if(/if (/e
autocmd BufWritePre *.php :%s/foreach(/foreach (/e
vnoremap > >gv
vnoremap < <gv

" omniautocomplete
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
imap <c-c> <c-x><c-o>
set completeopt="menu"

" make it easier to search whole project
let g:searchword = ''
nmap <c-f> :tabnew<CR>:LAck<Space>''<left>
nmap <c-f><c-f> :let g:searchword = expand("<cword>")<CR>:tabnew<CR>:LAck <C-R>=string(g:searchword)<CR>

" supertab
let g:SuperTabDefaultCompletionTypeDiscovery = [
            \ "&completefunc:<c-x><c-u>",
            \ "&omnifunc:<c-x><c-o>",
            \ ]
let g:SuperTabLongestHighlight = 1

" localvimrc
let g:localvimrc_sandbox = 0

" tab toggle
au TabLeave * :let g:tabno = tabpagenr()
map gg :exec 'normal!' . g:tabno . 'gt'<CR>

" current file
function! Pwf()
    execute "echo @%"
endfunction
command! -nargs=0  Pwf call Pwf()

" disable syntax highlighting for files over 100K
au BufReadPost * if getfsize(bufname("%")) > 102400 | set syntax= | endif

" open file under cursor in new tab
map <silent> <c-g> <c-w>gf

" backups
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" nerdtree
nmap <c-t> :NERDTree<CR>
