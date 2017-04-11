
" **************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'majutsushi/tagbar'
" Plugin 'CodeFalling/fcitx-vim-osx'

" async syntax checking plugin for Vim
" Plugin 'w0rp/ale'

" auto check python use pep8
Plugin 'nvie/vim-flake8'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons'

"" Colorthemes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/vim-tomorrow-theme'

Plugin 'vim-scripts/indentpython'

" best auto complete tool I have ever used(jedi, supertab...)
" Plugin 'Valloric/YouCompleteMe'

" tree explore plugin
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" super search
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'easymotion/vim-easymotion'

Plugin 'othree/eregex.vim'
Plugin 'dkprice/vim-easygrep'

" Plugin 'vim-syntastic/syntastic'

" provides automatic closing of quotes, parenthesis, brackets, etc. 输入引号,括号时,自动补全
Plugin 'Raimondi/delimitMate'

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'

" for visually displaying indent levels in Vim
Plugin 'nathanaelkane/vim-indent-guides'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'ShowTrailingWhitespace'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" **************************************************
" 映射 <leader> 键到 , 默认是 \
let mapleader=","
" 等待时间,如<leader>键后的输入
set timeoutlen=350

nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>


" ****** YouCompleteMe ******
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 触发补全快捷键
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
" 最小自动触发补全的字符大小设置为 3
let g:ycm_min_num_of_chars_for_completion = 3
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" YCM的previw窗口比较恼人，还是关闭比较好
set completeopt-=preview
" Vim's autocomplete is excruciatingly slow
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

" ****** airline ******
let g:airline_theme="luna"
set laststatus=2
" 终端显示 256 色
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif

let g:airline_powerline_fonts = 1

" 打开 tabline 功能，方便查看 Buffer 和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !has("gui_running")
	let g:airline_left_sep = "\uE0B4"
	let g:airline_right_sep = "\uE0B6"
	let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
endif

" ****** gruvbox ******
colorscheme gruvbox
" colorscheme Tomorrow-Night
set background=dark
" 语法高亮
syntax enable
" 关键字上色
syntax on

" ****** ctrlp ******
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ****** Tagbar ******
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <leader>tb :TagbarToggle<CR>

" ****** NERDTree ******
map <leader>t :NERDTreeToggle<CR>
map <S-m> <plug>NERDTreeTabsToggle<CR>
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif


" ****** NERD commenter ******
" 让注释符与语句之间留一个空格
let NERDSpaceDelims=1


" ****** delimitMate ******
let g:delimitMate_expand_cr = 1
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" ****** swordsmile ******
" Vim UI
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
set nobomb
" if has("gui_running")
if has("gui_macvim")
    set ambiwidth=double
    set lines=35 columns=140
endif

" 光标移动到buffer的顶部和底部时保持5行距离
set scrolloff=3

" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set showcmd

" 自动切换当前目录为当前文件所在的目录
set autochdir

" set fileformats=unix
set encoding=utf-8
set termencoding=utf-8
" 新建文件使用的编码
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,latin-1

" set autoread
" 允许不保存切换 buffer
set hidden

" 显示当前 mode
set showmode

set nobackup
set noswapfile
set nowritebackup

" 搜索忽略大小写
set ignorecase
" 智能大小写搜索
set smartcase

" 边输入边搜索
set incsearch
" 检索时高亮显示匹配项
set hlsearch

" 显示行号
set number
set relativenumber number
" 短暂回显匹配的括号
set showmatch
set matchtime=2
set shortmess=atl
set ruler

" 高亮当前行
set cursorline
set cursorcolumn

" 显示特殊符号
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set nowrap

set mouse=a

set noautoindent
set cindent
set smartindent

" 转化 tab 为空格
set expandtab
" tab 缩进为 4 个空格
set tabstop=4
" 自动缩进空格数
set shiftwidth=4
" 退格删除空格数
set softtabstop=4
set smarttab
" set foldmethod=indent

set whichwrap=b,s,<,>,[,],h,l

set backspace=indent,eol,start

autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
autocmd FileType html setlocal ts=2 sts=2 sw=2 et
autocmd FileType css setlocal ts=2 sts=2 sw=2 et
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix colorcolumn=80

" autocmd BufNewFile *.py 0r ~/.vim/template/python.py


" ignore compiled files
set wildignore=*.o,*~,*.pyc

nnoremap <leader>p :set invpaste paste?<CR>
" toggle paste
set pastetoggle=<leader>p

nnoremap <space> za


" Ctrl-j 切换到下方的分割窗口 - Ctrl-k 切换到上方的分割窗口 - Ctrl-l
" 切换到右侧的分割窗口 - Ctrl-h 切换到左侧的分割窗口
"split navigations
" 新分割窗口在下边
set splitbelow
" 新分割窗口在右边
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-X> :bd<CR>

" auto add pyhton header --start
" autocmd BufNewFile *.py 0r ~/.vim/template/python.py
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
endfun

fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
endfun
" auto add python header --end


" auto clear whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    endfun
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Vim可以记录上次打开某一文件时的光标位置，并在下次打开同一文件时将光标移动到该位置。
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set lines=35 columns=140
    " 使用内置 tab 样式而不是 gui
    set guioptions-=e
endif

if has("win32")
"    在 _vimrc 文件里的中文设置后加上下列命令,一定要加到最后
    set langmenu=zh_CN
    let $LANG = 'zh_CN.UTF-8'
    language messages zh_CN.utf-8
    set guifont=DejaVuSansMono_NF:h10:cANSI
    set gfw=Microsoft_YaHei_Mono:h10.5:cGB2312
    set clipboard+=unnamed
    set winaltkeys=no
"   set ambiwidth=double
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
