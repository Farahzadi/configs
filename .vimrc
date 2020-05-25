set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set termguicolors
set showcmd
set number
set relativenumber 
set ruler
set cursorline
set wildmenu
set lazyredraw
set showmatch
set hlsearch
set laststatus=2
set nowrap
set encoding=utf8
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" better backup, swap and undos storage for vim (nvim has nice ones by default)
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

filetype off
syntax enable
let g:elite_mode=1
let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim' 
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'mbbill/undotree'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

colorscheme dracula

filetype plugin indent on

nnoremap <space> za

" tab navigation mappings
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" NERDTree -----------------------------
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

