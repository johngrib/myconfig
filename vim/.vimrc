" Vundle 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PluginInstall<CR> 해주면 된다.
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 
  Plugin 'gmarik/Vundle.vim'  "required
  Plugin 'tpope/vim-fugitive' "required 
  Plugin 'kien/ctrlp.vim'     "파일 이름 검색 open
  Plugin 'shougo/vimproc.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'scrooloose/syntastic' " 파일을 저장할 때 자동으로 문법 검사
  Plugin 'tpope/vim-surround'
  "Plugin 'rking/ag.vim'
  Plugin 'yggdroot/indentline'
  Plugin 'bling/vim-airline'
  Plugin 'luochen1990/rainbow'   " 괄호 색깔을 다양하게 
  Plugin 'kshenoy/vim-signature' " mark 위치를 표시해준다.
  Plugin 'airblade/vim-gitgutter' " git diff 표시
  Plugin 'rking/ag.vim'
  "Plugin 'taglist.vim'
  Plugin 'matze/vim-move'         " <M-J>, <M-K> 로 선택한 라인을 위아래로 이동
  Plugin 'easymotion/vim-easymotion'
  Plugin 'johngrib/FlatColor-johngrib'
call vundle#end()            
filetype plugin indent on " Put your non-Plugin stuff after this line


" set 설정 ----------------------------------------------------------------------

  set nocp       " vi 기능을 사용하지 않고, vim 만의 기능을 사용.

  if has('mac')
    set macmeta    " osx 에서 Meta 키 조합을 사용할 수 있게 한다.
    "set guifont=Ubuntu\ Mono:h13
    "set guifont=monaco:h12
    "set guifont=inconsolata:h13
    "set guifont=DejaVu\ Sans\ Mono:h12
    "set guifont=Fira\ Mono:h13
    "set guifont=Meslo\ LG\ L\ DZ:h11
    set guifont=Meslo\ LG\ M\ DZ:h11
  endif

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
  nnoremap gv `[v`]    " highlight last inserted text
  
  " 사운드 벨, 비주얼 벨 비활성화
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

  "사용
  set bs=indent,eol,start  " backspace 키 사용 가능
  set shiftwidth=4         " shift를 4칸으로 ( >, >>, <, << )
  set tabstop=4            " tab을 4칸으로
  set expandtab 
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


  "colorscheme onedark 
  "colorscheme evolution
  "colorscheme dusk 
  "colorscheme eva01
  "colorscheme greywh
  "colorscheme freya
  colorscheme flatcolor-johngrib

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
  nnoremap <Space>y "+y
  nnoremap <Space>p "+p
  nnoremap <Space>a gg<S-v>G

  nnoremap gn       :call ToggleNumber()<cr>
  nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
  nnoremap <Space>r :CtrlP<CR>
  
  " NERDTree 관련
  nnoremap <F12>n :NERDTreeToggle<CR>
  nnoremap <F12>m :NERDTreeMirrorToggle<CR>
  nnoremap <F12>s :NERDTreeTabsFind<CR>

  " rainbow
  nnoremap <F12>r :RainbowToggle<CR>

" Easy motion 설정 -----------------------------------------------------------
  let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
  "map <Leader> <Plug>(easymotion-prefix)
  nmap <Space>f <Plug>(easymotion-f)
  nmap <Space>F <Plug>(easymotion-F)
  nmap <Space>t <Plug>(easymotion-t)
  nmap <Space>T <Plug>(easymotion-T)
  nmap <Space>s <Plug>(easymotion-overwin-f)
  nmap <Space>l <Plug>(easymotion-lineforward)
  nmap <Space>j <Plug>(easymotion-j)
  nmap <Space>k <Plug>(easymotion-k)
  nmap <Space>h <Plug>(easymotion-linebackward)

" Syntastic 설정 --------------------------------------------------------------------
" https://thechefprogrammer.blogspot.kr/2014/05/syntax-check-for-php-and-javascript.html
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_php_checkers = ['php']
  "let g:syntastic_check_on_wq = 0
  "let g:syntastic_mode_map = { 'mode': 'passive' }
  "nnoremap <silent> <F6> :SyntasticCheck<CR>

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

  let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" functions -------------------------------------------------------------------

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
