set nocompatible
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"--START bundle here
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Bundle 'Shougo/unite.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,uft-8
set fileformats=unix,dos,mac
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =‾ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =‾ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =‾ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =‾ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =‾ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =‾ ' '
    if &sh =‾ '¥<cmd'
      let cmd = '""' . $VIMRUNTIME . '¥diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '¥diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '¥diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"start custom settings
set history=200
set ignorecase
set ruler
colorscheme slate
set showmatch "閉じ括弧が入力されたとき、対応する括弧を表示する
set number
set mouse=a
syntax on
"set cursorline "カーソルライン強調
set clipboard=unnamed,autoselect
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
set laststatus=2 "display status line
set statusline=%F%r%h%= " ステータスラインの内容
set incsearch "set increamental search
set wildmenu wildmode=list:full

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

