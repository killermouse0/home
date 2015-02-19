set nocompatible

" Directories
" See :help feature-list
if has('win32')
	set dir=c:\\NoSave\tmp
	set undodir=c:\\NoSave\tmp\vim-undo
elseif has('unix')
	set dir=/tmp
	set undofile
	set undodir=~/.undo
end

execute pathogen#infect()

syntax on
colorscheme koehler
set visualbell

set backspace=indent,eol,start

" set listchars+=precedes:<,extends:>,trail:ø
set listchars+=precedes:<,extends:>,trail:�

" both go together for intended effect
set ignorecase
set smartcase


" line wrapping
set nowrap

" indentation
set ts=4
set sw=4
set noexpandtab
set softtabstop=4
set autoindent
set nosmarttab

filetype plugin indent on

" search
set incsearch
set hlsearch

set hidden

" Where to place new splits
set splitbelow
set splitright

set updatetime=10000
set number
set ruler

" misc autocmd
au BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile *.md setfiletype markdown
au BufEnter * lchdir %:p:h

augroup markdown
au!
au FileType *markdown*
	\ setlocal tw=78
	\ makeprg=markdown.cmd\ %:p\ %:p:r.html
	\ com= spelllang=fr
	\ foldmethod=marker
	\ commentstring=<!--%s-->
	\ spell |
	\ nnoremap <F10> :! %:p:r.html<CR> |
	\ au CursorHoldI,CursorHold * update
augroup END

let mapleader=","
nnoremap <F9> :make<CR>
nnoremap <Leader>r {V}gq
nnoremap <space> :noh<CR>

" FuzzyFinder
nnoremap <silent> <leader>f :FufFile doci:<CR>
nnoremap <silent> <leader>b :FufBuffer<CR>
let g:fuf_abbrevMap = { "^doci:" : [ "~/Documents/DocsInternes/**/", ], }

let g:rainbow_active = 1

com! DeleteFile call delete(expand('%')) | bd!
