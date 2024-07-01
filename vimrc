 "ViMrc - TiM
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-fugitive'
	Plug 'justinmk/vim-dirvish'
	Plug 'sstallion/vim-wtf'
	Plug 'sjl/badwolf'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-peekaboo'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'mtth/scratch.vim'
	Plug 'godlygeek/tabular',   { 'on': ['Tabularize', 'Tab'] }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'doums/darcula'
	Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
set t_Co=256
colorscheme dracula
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
" fzf
let g:fzf_statusline = 0
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR> 
nnoremap <silent> <leader>l :Lines<CR> 
" µcomplete
if has('patch-7.4.314')
  set shortmess+=c
endif
if has('patch-7.4.793')
  set belloff+=ctrlg
endif
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 200
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
" Airline
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
