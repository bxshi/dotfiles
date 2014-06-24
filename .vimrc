"undle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Vundle bundles
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'AnsiEsc.vim'
Bundle 'majutsushi/tagbar'

"Workaround for enabling filetype
filetype plugin on

syntax enable

set exrc
set secure

"Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set smartindent

"Delete could delete old text
set backspace=2

"brackets
set showmatch
set matchtime=1

"Encoding
set encoding=utf-8
set fencs=utf-8
set termencoding=utf-8
set fileencoding=utf-8

"Incremental search and highlight result
set incsearch
set hlsearch

set number
set ruler

"Reformat AnsiEscaped log
autocmd BufRead,BufNewFile *.log AnsiEsc

"Open a NERDTree at opening
"autocmd VimEnter * NERDTree | wincmd p
"Toggle NERDTree
nmap <F7> :NERDTree<CR> 
"Show hidden files
let NERDTreeShowHidden=1

"Tagbar Settings
nmap <F8> :TagbarToggle<CR>

"Syntastic Settings
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_no_include_search=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"Always show loc
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_checkers=['make']

"YCM Settings
"Set default YCM configuration file
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"Fix VimTip1228
set completeopt=longest,menu
"Close completion window when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"Enable label engine
let g:ycm_collect_identifiers_from_tags_files=1
"Start matching after 1 characters are typed
let g:ycm_min_num_of_chars_for_completion=1
"Enable cache matching
let g:ycm_cache_omnifunc=1
"Enable syntax completion
let g:ycm_seed_identifiers_with_syntax=1
"Enable completion in comments
let g:ycm_complete_in_comments=1
"Disable completion in strings
let g:ycm_complete_in_strings=0
"Do not use comments/strings for completion identification
let g:ycm_collect_identifiers_from_comments_and_strings=0
"Auto trigger completion by -> and .
let g:ycm_auto_trigger=1
"Change the color to something nice
highlight Pmenu ctermbg=white ctermfg=black cterm=bold
"Semantic triggers
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp,cpp.doxygen' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }


"Jump to definition or declaration
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"Jump back
nnoremap <leader>jb <C-O>
"Press Enter to select a completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"Highlight code exceeds 110 chars per line
highlight OverLength ctermbg=darkgray guibg=#592929
match OverLength /\%111v.\+/

"Hightlight trick
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.hpp,*.cpp set filetype=cpp.doxygen
	autocmd BufRead,BufNewFile *dox set filetype=doxygen
augroup END

"Search relative path in these path
let &path.="/home/bshi/graphlab/src,/home/bshi/graphlab/src/graphlab,./,"
