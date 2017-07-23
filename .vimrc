"http://qiita.com/delphinus/items/00ff2c0ba972c6e41542

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" --------------- dein end ---------------

syntax enable
set background=dark
colorscheme desert

"シンタックスハイライト有効
syntax on

"行番号を表示する
set number

"検索結果をハイライト
set hlsearch

"横線を入れる
set cursorline

" クリップボード
set clipboard+=unnamed

" backspace使用できるように
set backspace=indent,eol,start

" タイトルをウインドウ枠に表示する
set title

" 貼り付けのときのずれ
set paste

"インデント
set tabstop=2 shiftwidth=2 expandtab

"スワップファイルを作成しない
set noswapfile

"INSERTモードのときだけ横線解除
augroup set_cursorline
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!  "redraw!
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"bufferを切り替える時に編集中ファイルを保存しなくても良くなる機能
"show: http://qiita.com/qtamaki/items/4da4ead3f2f9a525591a
set hidden

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" neobundle deinに以降したから一旦コメントアウト
"set nocompatible               " Be iMproved
"filetype off                   " Required!
"
"if has('vim_starting')
"  if &compatible
"    set nocompatible               " Be iMproved
"  endif
"
"  set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
"
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'tpope/vim-rails'
"NeoBundle 'slim-template/vim-slim'
"NeoBundle 'kchmck/vim-coffee-script'
"NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'mxw/vim-jsx'
"NeoBundle 'JulesWang/css.vim'
"NeoBundle 'cakebaker/scss-syntax.vim'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'scrooloose/syntastic'
"
"call neobundle#end()
"
"filetype plugin indent on     " Required!
"
"" Installation check.
"if neobundle#exists_not_installed_bundles()
"  echomsg 'Not installed bundles : ' .
"        \ string(neobundle#get_not_installed_bundle_names())
"  echomsg 'Please execute ':NeoBundleInstall' command.'
"  "finish
"endif
