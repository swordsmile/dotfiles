" 20171103
" **************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 安装依赖 yum -y install ctags
Plugin 'majutsushi/tagbar'

" Plugin 'CodeFalling/fcitx-vim-osx'
" Plugin 'vim-scripts/VimIM'

Plugin 'sheerun/vim-polyglot'
" async syntax checking plugin for Vim 代码异步检测插件 ( vim8+ )
Plugin 'w0rp/ale'

" 代码检查 (Syntastic)
" Plugin 'vim-syntastic/syntastic'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 可以显示最近使用的文件列表、书签和存储在指定文件夹中的 session
Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons'

" Colorthemes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/vim-tomorrow-theme'
" Plugin 'jnurmine/Zenburn'

" 自动缩进插件 符合 PEP8 标准
Plugin 'vim-scripts/indentpython'

" python-mode
Plugin 'python-mode/python-mode'

" best auto complete tool I have ever used(jedi, supertab...) 自动补全 (YouCompleteMe)
" 一个随键而全的、支持模糊搜索的、高速补全的插件，太棒了！
Plugin 'Valloric/YouCompleteMe'

" tree explore plugin 工程文件浏览
Plugin 'scrooloose/nerdtree'
" 如果你想用 tab 键，可以利用 vim-nerdtree-tabs 插件实现
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" super search 超级搜索
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'

" 快速开关注释
Plugin 'scrooloose/nerdcommenter'

" 快速移动
Plugin 'easymotion/vim-easymotion'

Plugin 'othree/eregex.vim'
Plugin 'dkprice/vim-easygrep'

" auto check python use pep8. PEP8 代码风格检查
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'hdima/python-syntax'
Plugin 'Glench/Vim-Jinja2-Syntax'

" provides automatic closing of quotes, parenthesis, brackets, etc. 输入引号,括号时,自动补全
Plugin 'Raimondi/delimitMate'

" 括号显示增强
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'

" for visually displaying indent levels in Vim 可视化缩进
Plugin 'nathanaelkane/vim-indent-guides'

" Highlights trailing whitespace in red and provides
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'ShowTrailingWhitespace'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

Plugin 'elzr/vim-json'

Plugin 'gcmt/wildfire.vim'

Plugin 'Shougo/vimshell.vim'

" html
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'

" css
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'

" javascript
Plugin 'pangloss/vim-javascript'

" -----------------------------------------------
" git
" -----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" **************************************************
" keyboard
" 映射 <leader> 键 , 默认是 \ " 定义快捷键的前缀 , 即<Leader>
let mapleader=","
" 等待时间,如<leader>键后的输入
set timeoutlen=350

nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" insert mode shortcut
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
inoremap <A-d> <DELETE>
" 在光标下方，上方插入新行
inoremap <A-o> <Esc>o
inoremap <A-O> <Esc>O
" 删除当前行
inoremap <A-d> <C-o>dd
" 删除当前行并重写
inoremap <A-r> <Esc>cc

" F1 - F6 设置
inoremap <F1> <Esc>

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" when in insert mode, press <F5> to go to
" paste mode, where you can paste mass data
" that won't be autoindented
" set pastetoggle=<F5>
nnoremap <F5> :set invpaste paste?<CR>
" toggle paste
set pastetoggle=<F5>
" nnoremap <leader>p :set invpaste paste?<CR>
" toggle paste
" set pastetoggle=<leader>p

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1


" Python syntax
let python_highlight_all=1

" ale
let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1


" ****** YouCompleteMe ******
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 触发补全快捷键
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
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
" CSS
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }


" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ****** airline ******
let g:airline_theme="luna"
set laststatus=2
" 终端显示 256 色
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
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
" 启动时自动 focus
let g:tagbar_autofocus=1
nmap <leader>tb :TagbarToggle<CR>
" nmap <F8> :TagbarToggle<CR>

" ****** NERDTree ******
map <leader>t :NERDTreeToggle<CR>
map <S-m> <plug>NERDTreeTabsToggle<CR>
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" 是否自动开启nerdtree
" thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ****** NERD commenter ******
" 让注释符与语句之间留一个空格
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
			\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
			\ 'less': { 'left': '/*', 'right': '*/' }
		\ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 0



" ****** delimitMate ******
let g:delimitMate_expand_cr = 1

" ****** 可视化缩进 ******
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" ****** easymotion ******
" 更改快捷键
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" markdown
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" vim-javascript
let javascript_enable_domhtmlcss = 1

" emmet-vim
autocmd filetype *html* imap <c-_> <c-y>/
autocmd filetype *html* map <c-_> <c-y>/

" python-mode
" let g:pymode_python = 'python3'

" javascript

" ****** swordsmile ******

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" Vim UI
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set nobomb
" if has("gui_running")
if has("gui_macvim")
    set ambiwidth=double
    set lines=35 columns=140
endif

" 光标移动到buffer的顶部和底部时保持5行距离
set scrolloff=5

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

" 边输入边搜索 开启实时搜索功能
set incsearch
" 检索时高亮显示匹配项
set hlsearch
" 设置高亮颜色
highlight Search ctermbg=grey ctermfg=black

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" 显示行号
set number
set relativenumber number
" 短暂回显匹配的括号
set showmatch
set matchtime=2
set shortmess=atl
" 显示光标当前位置
set ruler

" 高亮当前行/列
set cursorline
set cursorcolumn

" 显示特殊符号
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" 禁止折行
set nowrap

" 鼠标暂不启用, 键盘党....
set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide

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
autocmd FileType md setlocal ts=2 sts=2 sw=2 et
autocmd FileType html setlocal ts=2 sts=2 sw=2 et
autocmd FileType css setlocal ts=2 sts=2 sw=2 et
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix colorcolumn=80

autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix colorcolumn=80
" autocmd BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" autocmd BufNewFile *.py 0r ~/.vim/template/python.py


" ignore compiled files
set wildignore=*.o,*~,*.pyc

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
" autocmd BufNewFile *.py ks|call FileName()|'s
" autocmd BufNewFile *.py ks|call CreatedTime()|'s
" autocmd BufNewFile * normal G

" 定义函数 AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
autocmd FileWritePre,BufWritePre *.sh,*.py ks|call DateInsert()|'s

function! AutoSetFileHead()
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "\####################################")
        call append(line(".")+1, "\# File Name: ".expand("%:t"))
        call append(line(".")+2, "\# Author: swordsmile")
        call append(line(".")+3, "\# Mail: 1627989802@qq.com")
        call append(line(".")+4, "\# Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+5, "\# Last Modified: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+6, "\####################################")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "\# -*- coding: utf-8 -*-")
        call append(line(".")+1, "\####################################")
        call append(line(".")+2, "\# File Name: ".expand("%:t"))
        call append(line(".")+3, "\# Author: swordsmile")
        call append(line(".")+4, "\# Mail: 1627989802@qq.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+6, "\# Last Modified: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+7, "\####################################")
    endif

    normal G
    normal o
    normal o
    normal o
    autocmd BufNewFile * normal G
endfunc

function! DateInsert()
    call cursor(8,1)
    if search('Last Modified') != 0
        let line = line('.')
        call setline(line,"\# Last Modified: " . strftime("%Y-%m-%d %T"))
    endif
endfunction


" auto add python header --end


" auto clear whitespace
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    endfun
" autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Vim可以记录上次打开某一文件时的光标位置，并在下次打开同一文件时将光标移动到该位置。
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

if has("gui_running")
    " 禁止显示菜单和工具条
    set guioptions-=m
    set guioptions-=T
    " 禁止显示滚动条
    set guioptions-=L
    set guioptions-=R
    set guioptions-=l
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

au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
