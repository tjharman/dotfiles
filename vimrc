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
	Plug 'mgee/lightline-bufferline'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'twitvim/twitvim', { 'on': ['PosttoTwitter', 'FriendsTwitter', 'RepliesTwitter', 'DMTwitter']}
	Plug 'junegunn/vim-peekaboo'
	Plug 'mtth/scratch.vim'
	Plug 'godlygeek/tabular',   { 'on': ['Tabularize', 'Tab'] }
	Plug 'mhinz/vim-grepper',   { 'on':  'Grepper' }
	if has('python')
	Plug 'FelikZ/ctrlp-py-matcher'
	endif
call plug#end()
set t_Co=256
colorscheme badwolf
let mapleader=","               " I'll use comma thanks
set hidden
set hlsearch			" highlight all search matches
set number 			" Linenumbers
set showcmd 			" Show command
set lazyredraw			" Lazy redrawing
set cursorline 			" Show where we're at
set ttyfast 			" My TTY is plenty fast...
set shortmess+=I
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
let g:ctrlp_cmd                 = 'CtrlPMixed'
let g:ctrlp_extensions          = ['undo', 'line', 'mixed']
let g:ctrlp_match_window        = 'bottom,order:ttb'
let g:ctrlp_switch_buffer       = 0
let g:ctrlp_working_path_mode   = 0
let g:ctrlp_use_caching         = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden         = 1
let g:ctrlp_max_files           = 0
let g:ctrlp_lazy_update         = 250
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
" TwitVim
let twitvim_browser_cmd = 'links'
nnoremap <silent> <leader>tp :PosttoTwitter<CR> 	" Post
nnoremap <silent> <leader>tf :FriendsTwitter<CR> 	" Friends
nnoremap <silent> <leader>tr :RepliesTwitter<CR> 	" Replies 
nnoremap <silent> <leader>td :DMTwitter<CR> 		" Direct Messages
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
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif   
let g:dirvish_mode = ':sort ,^.*[\/],'
