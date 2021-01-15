""""""""""""""""""""""""""""""""""""""
" Author: 鄭皓中
" GitHub: https://github.com/reverie0829/My_vimrc.git
" License: MIT
"
" Last Update: 2021-01-15
""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" System
"""""""""""""""""""""""""""""
set nocompatible        "關閉兼容模式（必要）
set noerrorbells        "關閉系統出錯時發出的響聲
set visualbell          "代替bell的是螢幕閃爍


""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""
set nu                  " Show line number
set wrap                " Wrap long lines
set showmatch           " Show matching brackets when closing it
set matchtime=2         " Matching brackets highlight duration (200ms)
set showcmd             " Show command status
set scrolloff=3         " Start to scroll when reaching lines before the edge
set mouse=a             " Enable mouse control in all modes
set laststatus=2        " Show status line
set cursorline          " Highlight current line
if has("syntax")
  syntax on
endif

"""""""""""""""""""""""""""""
" Text Formatting
"""""""""""""""""""""""""""""
set shiftwidth=4            
set tabstop=4                   " A tab consumes 4 space
set expandtab                   " Tabs are spaces
set softtabstop=4               " Delete tabstop spaces when spaces are tab
set autoindent                  " 按下enter後 下一行縮進會自動跟上一行一致 
set smartindent
filetype plugin indent on       " Enable specific formatting rules support for certain filetypes

"""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""
set hlsearch                    " Highlight search results
"set incsearch                  " Instantly search while typing
set ignorecase                  " Case-insensitive search
set smartcase                   " Switch to case-sensitive search when keywords contain uppercase
set wildmenu                    " Enable wildmenu while entering tab in command mode
set wildmode=list:longest,full  " Allow full list and auto-completion in wildmenu

"""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle', 'tag': '5.0.0' }
Plug 'majutsushi/tagbar', {'on':['TagbarToggle'], 'tag': 'v2.7' }
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
call plug#end()

"""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""" 
"常駐左邊標示列
"let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"字定義error和warning圖標
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
"在vim自帶的狀態蘭中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✔ OK'] "用不到
"顯示Linter名稱,出錯或警告等相關信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一個錯誤或警告，sn前往下一個錯誤或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s開啟/關閉語法檢查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看錯誤或警告的詳細信息
nmap <Leader>d :ALEDetail<CR>

"""""""""""""""""""""""""""""
" Theme and specific settings 
" for vim and gvim
"""""""""""""""""""""""""""""
set background=dark
if !has('gui_running')
    set t_Co=256
    colors wombat256i           " Default colorscheme for console vim
else
    colors wombat256            " Default colorscheme for gvim
    "set guifont=Source\ Code\ Pro\ 10		" Recommended font
    set guioptions-=r           " Remove right-hand scroll bar
    set guioptions-=L           " Remove left-hand scroll bar
    "set guioptions-=T          " Remove toolbar
    "set guioptions-=m          " Remove menu bar
    set guioptions+=a           " Enable copy-on-select
endif

" lightline specific settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
hi CursorLine cterm=none ctermbg=DarkGray  "顯示游標所在的列的highlight
set noshowmode

"""""""""""""""""""""""""""""
" Key remap
"""""""""""""""""""""""""""""
" Non-plugin related
nnoremap <C-h> <Esc>gT  "切換到下個分頁
nnoremap <C-l> <Esc>gt  "切換到上個分頁
:inoremap ( ()<Esc>i
:inoremap {<CR> {<CR>}<Esc>ko
:inoremap {{ {}<Esc>i
inoremap jj <Esc>
inoremap ;; <Esc>A;<Esc>
:inoremap {<Space> <Esc>A{<CR>}<Esc>ko

nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F3> :tabnew<CR>
nnoremap <F4> :noh<CR>
noremap <F7> :wq<CR>
noremap <F6> :q!<CR>
noremap <F5> :w<CR>

"保存當下的session
nnoremap <F8> :mksession! ~/.vim_manual_session.vim<CR>
"載入session
nnoremap <F9> :source ~/.vim_manual_session.vim<CR>

" Plugin related
"nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :TagbarToggle<CR>

" clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-p> "+p
inoremap <C-v> <C-r>+

