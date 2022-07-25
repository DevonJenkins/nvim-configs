""""""""""""""""""""""""""""""""""""""""""""""""""
"                   init.vim 
""""""""""""""""""""""""""""""""""""""""""""""""""
lua require ('djenkins.packer')
"lua require ('mini.starter').setup({})

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/bundle')

Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'roman/golden-ratio'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'mhinz/vim-startify', {'branch': 'center'}
Plug 'iamcco/markdown-preview.nvim', 
            \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'alvan/vim-closetag'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tpope/vim-surround'
Plug 'dracula/vim'
Plug 'kshenoy/vim-signature'

call plug#end()            " required

set termguicolors
let g:gruvbox_contrast_dark = 'medium'
set background=dark  
"autocmd vimenter * ++nested colorscheme dracula
autocmd BufNewFile *.html 0r ~/.vim/skeletons/skeletons/page.html
autocmd FileType json syntax match Comment +\/\/.\+$+
syntax on
set nu
set tabstop=4 
set softtabstop=0
set shiftwidth=4 
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab 
set ruler 
set smartindent 
set noerrorbells 
set novisualbell
set visualbell t_vb=
set incsearch 
set scrolloff=8
set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
set undofile                    "turn on the feature"""
set noswapfile 
set nobackup 
set signcolumn=yes 
set colorcolumn=80
set textwidth=80
set exrc 
set relativenumber 
set wrap

"""""""""""""""""""""""""""""""""""""""""""""
"                    remappings
"""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Return>o o<Esc>
nnoremap <Return>O O<Esc>
nnoremap <silent> <Esc> :noh<return><Esc>
nnoremap ∆ <M-J>  
nnoremap ˚ <M-K> 
"set fillchars+=vert:\ 


""""""""""""""""""""""""""""""""""""""""""
"                Mappings to move lines like in VS code
""""""""""""""""""""""""""""""""""""""""""
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


""""""""""""""""""""""""""""""""""""""""""
"              tmux vim nav remappings 
""""""""""""""""""""""""""""""""""""""""""
"These remappings only work within tmux. Set tmux to auto-open in your shell
"config

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Auto Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype indent on

set ai

set si 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Toggles 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

"set pastetoggle=<f5> 
map <F5> :set pastetoggle<CR>

map <F3> :AutoSaveToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         startify 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_lists = [
        \ { 'header': ['  '],            'type': 'files' },
        \ ]

" this is the format for entering ascii art  \' ---put art in here---   ',
let g:startify_custom_header =
          \[
            \'     /^\    /^\ ' ,
            \'    {  O}  {  O}',
            \'     \ /    \ /',
            \'     //     //       _------_',
            \'    //     //     ./~        ~-_',
            \'   / ~----~/     /              \ ',
            \' /         :   ./       _---_    ~-',
            \'|  \________) :       /~     ~\   |',
            \'|        /    |      |  :~~\  |   |',
            \'|       |     |      |  \___-~    |',
            \'|        \ __/`^\______\.        ./',
            \' \                     ~-______-~\.',
            \' .|                                ~-_',
            \'/_____________________________________~~____' 
            \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Tabs for different filetypes 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"You should put that in ~/.vim/after/ftplugin/html.vim instead.
"But as others have pointed out below, it’s much nicer to just add autocmd 
"FileType html setlocal shiftwidth=2 tabstop=2 to your .vimrc   

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType ejs setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=2 tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               autosave
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    hexokinase 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = [ 'virtual' ]


