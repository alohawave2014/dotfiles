"-- Start Neobundle Settings
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

NeoBundle 'Shougo/neobundle.vim'

"start own plugin here
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/neomru.vim'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
filetype plugin indent on

"ask if you have a not installed plug-in
NeoBundleCheck
"-- End NeoBundle Settings
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

