" --------------- dein start ---------------
"show:http://qiita.com/delphinus/items/00ff2c0ba972c6e41542

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
filetype plugin indent on

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
set clipboard+=unnamed,autoselect

" backspace使用できるように
set backspace=indent,eol,start

" タイトルをウインドウ枠に表示する
set title

" 貼り付けのときのずれ
set paste

"インデント
set tabstop=2 shiftwidth=2 expandtab

" 改行時に前の行のインデントを継続する
set showmatch

"スワップファイルを作成しない
set noswapfile

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"bufferを切り替える時に編集中ファイルを保存しなくても良くなる機能
"show: http://qiita.com/qtamaki/items/4da4ead3f2f9a525591a
set hidden

"INSERTモードのときだけ横線解除
augroup set_cursorline
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!  "redraw!
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

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

"ctrlpvim/ctrlp.vim key mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,backbone'

"syntasticの設定
let g:syntastic_mode_map = {
  \ 'passive_filetypes': ['html', 'scss']
  \}
let g:syntastic_auto_loc_list = 1

"vue syntax
autocmd FileType vue syntax sync fromstart

" 列のライン
set cursorcolumn
