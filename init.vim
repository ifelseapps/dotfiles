set number
set cursorline
set foldcolumn=2
set termguicolors
set noswapfile
set hlsearch
set encoding=UTF-8
syntax on

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
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['typescript', 'typescriptreact']} 
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'chun-yang/auto-pairs'
Plug 'docunext/closetag.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'liquid'] }
Plug 'tpope/vim-liquid'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
call plug#end()

filetype plugin on

colorscheme nord
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan
hi Search guibg=LightBlue

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html PrettierAsync

