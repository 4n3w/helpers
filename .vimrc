" This is my .vimrc; there are many like it, but this one is mine.
"
set term=builtin_xterm

" Set commandline to 2 lines high
set ch=2

" Enable Pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set guifont=Monaco:h14
set background=dark

colorscheme solarized

" erlang stuff.
" code folding with space button
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" autocomplete CTRL-P
" CTRL-X CTRL-O to activate omni completion (type module name first)
let g:erlangManPath='/opt/local/lib/erlang/man'

" Automatically read changes from disk
set autoread

" Automaticall write changes to disk
" set autowriteall

" hit F2 to toggle annoying paste mode for vim
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" make cmd-line completion better
set wildmenu

set nocompatible

filetype plugin indent on

syntax on
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
" http://www.linux.com/archive/feature/120126
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}\ %{&fo}]\ [%l/%L,%v\ %p%%]\ [HEX=\%02.2B]

" Set the status line the way i like it (derek wyatt's)
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Highlight search
set hlsearch

" Always show the status line
set laststatus=2

set tabstop=4 "set tab character to 4 characters
set shiftwidth=4 "indent width for autoindent
set expandtab "turn tabs into whitespace
set smartindent

au FileType python setl sw=2 sts=2 et
au FileType js,javascript setl sw=2 sts=2 et "For node.
au FileType html,xhtml,xml  setl sw=2 ts=2 et


"au BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w72
"au BufWriteCmd *.pdf setl readonly

" JJM Highlight extra white space.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Give an indicator when we approach col 80 (>72)
au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>72v', -1)
" Give a strong indicator when we exceed col 80(>80)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" Give an indicator of tailing white space.
au BufWinEnter * let w:m3=matchadd('ErrorMsg', '\s\+$', -1)
" Give an indicator of spaces before a tab.
au BufWinEnter * let w:m4=matchadd('ErrorMsg', ' \+\ze\t', -1)

" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Open NERDTree if no filename given.
" autocmd vimenter * if !argc() | NERDTree | endif
