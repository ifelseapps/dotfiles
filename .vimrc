set number
set foldcolumn=2
set termguicolors

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " File search
Plug 'junegunn/fzf.vim' " File search
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['ts']} 
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'chun-yang/auto-pairs'
Plug 'docunext/closetag.vim'
call plug#end()

filetype plugin on

colorscheme nord

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list

" FZF options
" Предварительно установить https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_OPTS    = '--reverse'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"
" Ctrl + f
nnoremap <silent> <C-f> :Files<CR>
" NerdTree " Ctrl + t
nnoremap <C-t> :NERDTreeToggle<CR>

" COC
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
nnoremap <silent> K :call CocAction('doHover')<CR>

