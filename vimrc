 "ViMrc - TiM
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-eunuch'
	Plug 'justinmk/vim-dirvish'
	Plug 'sstallion/vim-wtf'
	Plug 'sjl/badwolf'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/lightline-powerful'
	Plug 'itchyny/vim-gitbranch'
	Plug 'mgee/lightline-bufferline'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-peekaboo'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'mtth/scratch.vim'
	Plug 'godlygeek/tabular',   { 'on': ['Tabularize', 'Tab'] }
	Plug 'mhinz/vim-grepper',   { 'on':  'Grepper' }
call plug#end()
set t_Co=256
colorscheme badwolf
let mapleader=","               " I'll use comma thanks
set hidden
set hlsearch			" highlight all search matches
set number 			" Linenumbers
set showcmd 			" Show command
set cursorline 			" Show where we're at
set ttyfast 			" My TTY is plenty fast...
set shortmess+=I
set modeline
set commentstring=#\ %s
"These 6 lines disable plugins installed by default, that I don't want.
let g:loaded_netrw             = 1 "$VIMRUNTIME/autoload/netrw.vim
let g:loaded_netrwFileHandlers = 1 "$VIMRUNTIME/autoload/netrwFileHandlers.vim
let g:loaded_netrwPlugin       = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
let g:loaded_netrwSettings     = 1 "$VIMRUNTIME/autoload/netrwSettings.vim
let g:loaded_vimball           = 1 "$VIMRUNTIME/autoload/vimball.vim
let g:loaded_vimballPlugin     = 1 "$VIMRUNTIME/plugin/vimballPlugin.vim
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" Create directories that don't exist
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimundo'
silent execute '!mkdir -p $HOME/.vimswap'
" Lots of Undos
set undofile                    " Save undo's after file closes
set undodir=$HOME/.vimundo      " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
" Backup and Swap Location
set dir=$HOME/.vimswap 			" Swap file location - Local not in
set backupdir=$HOME/.vimbackup 		" Backup Location - Local not in
" Ctrl-P
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
"
nnoremap <silent> <leader>u :CtrlPUndo<CR>		" Undo List
nnoremap <silent> <leader>b :CtrlPBuffer<CR>		" Buffer List
nnoremap <silent> <leader>l :CtrlPLine<CR>           " CtrlPLine
"Lightline
set noshowmode 						" Don't need this lightline shows us what mode we're in.
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }
"Bufferline
set showtabline=2
if has('gui_running')
	set guioptions-=e
endif
let g:lightline.tabline                = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand       = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type         = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 2
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" Grepper
nnoremap <leader>g :Grepper -tool rg<CR>                " Open Grepper using rg
" µcomplete
if has('patch-7.4.314')
  set shortmess+=c
endif
if has('patch-7.4.793')
  set belloff+=ctrlg
endif
let g:mucomplete#enable_auto_at_startup = 0
let g:mucomplete#spel#good_words        = 1
let g:mucomplete#spel#max               = 10
let g:mucomplete#chains = {
        \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl', 'c-n', 'c-p'],
        \ 'vim'     : ['path', 'cmd', 'keyn', 'incl']
        \ }
if has('patch-7.4.775')
  set completeopt+=menuone,noinsert,noselect
  fun! s:toggle_completeopt()
    if exists('#MUcompleteAuto')
      setlocal completeopt+=noinsert,noselect
    else
     setlocal completeopt-=noinsert,noselect
    endif
  endf
  nnoremap <silent> <leader>mu :<c-u>MUcompleteAutoToggle<CR>:call <sid>toggle_completeopt()<CR>
endif
" Peekaboo
let g:peekaboo_ins_prefix = '<c-x>'
" Scratch
let g:scratch_top              = 0
let g:scratch_no_mappings      = 1
let g:scratch_persistence_file = '/home/tim/.vimscratch'
nmap <leader>gs <plug>(scratch-insert-reuse)
nmap <leader>gS <plug>(scratch-insert-clear)
xmap <leader>gs <plug>(scratch-selection-reuse)
xmap <leader>gS <plug>(scratch-selection-clear)
" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
" If we have python, tweak a few settings for speed
if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  let g:plug_threads     = 4
endif
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif   
let g:dirvish_mode = ':sort ,^.*[\/],'
