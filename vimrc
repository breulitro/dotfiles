if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start " allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set bg=dark
set noerrorbells

" Follows coding standard of UEFI
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab
"set textwidth=80
"set showmatch
"set ff=dos

" Commenting due to UEFI coding standard
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set showmatch

set cscopetag
set cscopetagorder=1

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

filetype plugin on

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[4%dm
	set t_Sf=^[3%dm
endif


highlight ExceedColumn ctermbg=lightred ctermfg=yellow
highlight ExtraWhitespace ctermbg=lightgreen

" Avoid beeing cleared by future colorscheme commands
autocmd ColorScheme * highlight ExceedColumn ctermbg=lightred guibg=yellow
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightgreen

"match ExtraWhitespace /\s\+$/
"match ExtraWhitespace /\s\+$\| \+\ze\t/
"match ExtraWhitespace /[^\t]\zs\t\+/
"match ExtraWhitespace /^\t*\zs \+/

" Commenting due to UEFI coding standard
"au BufWinEnter,BufRead * match ExtraWhitespace /^\s* \s*\|\s\+$/
au BufWinEnter,BufRead * match ExtraWhitespace /\s\+$/
au BufWinEnter,BufRead *.c,*.h,*.cpp 2match ExceedColumn '\%>80v.\+'

nmap ] <C-]>
nmap [ <C-t>
nmap <F2> :bp<CR>
nmap <F3> :bn<CR>
nmap <F4> :bdelete<CR>


" Only do this part when compiled with support for autocommands
if has("autocmd")
	augroup fedora
	autocmd!
	" In text files, always limit the width of text to 78 characters
	autocmd BufRead *.txt set tw=78
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
	" don't write swapfile on most commonly used directories for NFS mounts or USB sticks
	autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
	" start with spec file template
	autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
	autocmd FileType * set formatoptions=tcql nocindent comments&
	"autocmd FileType c,cpp,h    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
	augroup END
endif

" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1		" make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 0	" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 0 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 1		" <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplForceSyntaxEnable = 1
