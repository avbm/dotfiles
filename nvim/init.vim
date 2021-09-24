" mouse support disabled for sane copy/paste
set mouse=

"let mapleader = "\<Space>"

" manage tabs
set tabstop=8
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""
" Plugins and plugin config "
"""""""""""""""""""""""""""""

let s:plugins = filereadable(expand("~/.config/nvim/autoload/plug.vim", 1))

" Bootstrap plug.vim on new systems
if !s:plugins "{{{
  fun! InstallPlug()
    silent call mkdir(expand("~/.config/nvim/autoload", 1), 'p')
    silent! exe '!curl -fLo '.expand("~/.config/nvim/autoload/plug.vim", 1)
      \ .' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endfun
  call InstallPlug()
endif

call plug#begin('~/.local/share/nvim/bundle')

"
" List Plugins
"

" Lightweight powerline type statusbar
Plug 'vim-airline/vim-airline'

" base16 color themes
Plug 'chriskempson/base16-vim'

" code dark color theme
Plug 'tomasiser/vim-code-dark'

" Manage Tabs and align on '='
Plug 'godlygeek/tabular'

" Linting for multiple languages
Plug 'dense-analysis/ale'

" Support for editorconfig
Plug 'editorconfig/editorconfig-vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git support
Plug 'tpope/vim-fugitive'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Go specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Puppet support
Plug 'rodjek/vim-puppet'
"git clone https://github.com/vim-syntastic/syntastic


call plug#end()
""""""""""""""""""""
" End Plugin config
""""""""""""""""""""

" Load base16 theme from shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme codedark

" coc.vim settings
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
