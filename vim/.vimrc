" Vundle 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PluginInstall<CR> 해주면 된다.
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'gmarik/Vundle.vim' "required
  Plugin 'tpope/vim-fugitive' "required 
  Plugin 'nathanaelkane/vim-indent-guides'
  "Plugin 'dracula/vim'
  Plugin 'flazz/vim-colorschemes'
  "Plugin 'scrooloose/syntastic' " 이걸 설치하면 :E 가 작동하지 않는다.
  Plugin 'tpope/vim-surround'
  Plugin 'kien/ctrlp.vim'
  "Plugin 'rking/ag.vim'
  Plugin 'yggdroot/indentline'
  Plugin 'bling/vim-airline'
call vundle#end()            
filetype plugin indent on " Put your non-Plugin stuff after this line

" set 설정 ----------------------------------------------------------------------

  set nocp       " vi 기능을 사용하지 않고, vim 만의 기능을 사용.

  " 검색
  set smartcase   " 대문자가 검색어 문자열에 포함될 때에는 noignorecase
  set ignorecase  " 검색시 대소문자 무시
  set hlsearch    " 검색시 하이라이트(색상 강조)
  set incsearch   " 검색 키워드 입력시 한 글자 입력할 때마다 점진 검색
  "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.
  set wildmenu    " command line 에서 tab 으로 자동완성이 가능. :e 로 파일 이름을 찾을 때 편함.
  set wmnu        " tab 자동완성시 가능한 목록을 보여줌

  " 화면 표시
  set nu               " 라인 넘버 출력
  set ruler            " 현재 커서 위치 (row, col) 좌표 출력
  set noerrorbells     " 에러 알림음 끄기
  set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
  set laststatus=2     " 상태바를 언제나 표시할 것
  set showmatch        " 일치하는 괄호 하이라이팅
  set cursorline       " highlight current line
  set lazyredraw       " redraw only when we need to.
  nnoremap gq `[v`]    " highlight last inserted text
  
  " 사운드 벨, 비주얼 벨 비활성화
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

  "사용
  set bs=indent,eol,start  " backspace 키 사용 가능
  set shiftwidth=4         " shift를 4칸으로 ( >, >>, <, << )
  set tabstop=4            " tab을 4칸으로
  "set noimd               " no imdisable 한글 입력기 관련.. 인데 osx 에서는 안 통하는듯 
  set cindent              " C언어 자동 들여쓰기
  set autoindent           " 자동 들여쓰기
  set smartindent
  set history=1000         " vi 편집기록 history .viminfo에 기록
  
" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
  au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

  colorscheme onedark 

  syntax on
  "if has("syntax")
   "syntax on
  "endif

" map 설정 ----------------------------------------------------------------------

  nnoremap <F10>r :source ~/.vimrc<CR>

  " ctrl-j 로 라인을 분리. " http://goo.gl/qxOlY
  nnoremap <NL> i<CR><ESC> 

  " copy , paste , select 기능 보완
  nnoremap Y y$
  noremap <Space>y  "+y
  nnoremap <Space>p "+p
  nnoremap <Space>a gg<S-v>G

  nnoremap gn :call ToggleNumber()<cr>
  nnoremap <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
  nnoremap <C-S-R> :CtrlP<CR>
  
  " NERDTree 관련
  nnoremap <F12>n :NERDTreeToggle<CR>
  nnoremap <F12>m :NERDTreeMirrorToggle<CR>
  nnoremap <F12>s :NERDTreeTabsFind<CR>

" 버퍼 관련 ------------------------------------------------------------------------
" @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html

  " vim-airline 버퍼 목록 켜기 
  let g:airline#extensions#tabline#enabled = 1
  " vim-airline 버퍼 목록 파일명만 출력
  let g:airline#extensions#tabline#fnamemod = ':t'

  nnoremap <C-T> :enew<CR>  " 새로운 버퍼를 연다 
  nnoremap gt :bnext!<CR>    " 다음 버퍼로 이동 
  nnoremap gr :bprevious!<CR> " 이전 버퍼로 이동 
  nnoremap gq :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동

" etc -------------------------------------------------------------------------

" functions -------------------------------------------------------------------

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
