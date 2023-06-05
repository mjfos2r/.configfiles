call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"MAKE SURE TO USE SINGLE QUOTES
"can use shorthand e.g. 'github/repo' or any valid git URL e.g. 'https://github.com/user/repo.git'

"syntax coloring woohoo!
"colored brackets
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

"syntax highlighting
Plug 'sheerun/vim-polyglot'

"ole faithful nord, i forgot how much better afterglow is.
"Plug 'arcticicestudio/nord-vim'

"This is much better on the eyes in the SSH client...
Plug 'danilo-augusto/vim-afterglow'

"and the icons and sugar who can forget that...
Plug 'ryanoasis/vim-devicons'

"lightline powerbar!
Plug 'itchyny/lightline.vim'

"NerdTree file system viewer
Plug 'scrooloose/nerdtree'

" auto completion/code suggestion
"Plug 'SirVer/ultisnips' 
"let g:UltiSnipsExpandTrigger="<Space-Tab>"
"let g:UltiSnipsListSnippets="<S-Tab>"
"let g:UltiSnipsJumpForwardTrigger="<S-j>"
"let g:UltiSnipsJumpBackwardTrigger="<S-k>"
"We'll come back to this one day

Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

"tpope's surround plugin
"cs changes surroundings
"ds removes delimiters
"ys adds surroundings, iw is text obj
"refer to github.com/tpope/vim-surround/blob/master/doc/surround.txt for more
"help on commands

Plug 'nathanaelkane/vim-indent-guides'

" this is the handy dandy auto-pair for {},[],"",'',() pairs. does allow for
" multi-line pair completion
Plug 'jiangmiao/auto-pairs'

"indention line shower
Plug 'Yggdroot/indentLine'

"to install plugins, run :PlugInstall within vim

"initialize plugin system
call plug#end()


"this is is lightline config
if !has('gui_running')
	set t_co=256
endif
let g:lightline = {
	\ 'colorscheme': 'afterglow',	
	\}
colorscheme afterglow 
"""NERDTREE SETTINGS
"open nerdtree on vim open
autocmd VimEnter * NERDTree

"refresh current folder for any changes
autocmd BufEnter NERD_tree* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() |endif

"reload window if directory is changed
augroup DIRCHANGE
	au!
	autocmd DirChanged global :NERDTreeCWD
augroup END 

"close NERDTree automatically if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NERDTREE KEYBIND
nnoremap <S-n> :NERDTreeToggle<CR>

"""NERDTREE SETTINGS END

"highlight current line and set color
set wrap
set cursorline
set cursorcolumn
set autoindent
set complete-=i
set smarttab
set laststatus=2
set backspace=indent,eol,start
set ruler
set matchpairs+=<:>
set ttyfast
set number

"added lines do not force entry into insert mode
nnoremap o o<esc>
nnoremap O O<esc>

"navigation remaps
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"""EASY ALIGN KEYMAPPING STUFF
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""color mapping for alignment shower"""
let g:indentLine_setColors = 0
:syntax enable

let g:ycm_key_invoke_completion = '<j-j>'
let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_autoclose_preview_window_after_insertion = 1	
