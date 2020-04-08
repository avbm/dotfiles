" mouse support disabled for sane copy/paste
set mouse=

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

" Manage Tabs and align on '='
Plug 'godlygeek/tabular'

call plug#end()
""""""""""""""""""""
" End Plugin config
""""""""""""""""""""
