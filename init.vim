set number
set relativenumber
" set cursorline
set foldcolumn=2
set updatetime=250
set incsearch
set nobackup
set nowb
set noswapfile
set hlsearch
set encoding=UTF-8
syntax on
set nowrap
set wrapmargin=0
set scrolloff=8
set numberwidth=3
let mapleader = " "

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

call plug#begin()
Plug 'yassinebridi/vim-purpura'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " File search
Plug 'junegunn/fzf.vim' " File search
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
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
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin on

colorscheme purpura 
set background=dark
let g:airline_theme = 'purpura'
" hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan
"hi Search guibg=LightBlue
highlight! link SignColumn LineNr
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE guifg=DarkMagenta
autocmd vimenter * hi FoldColumn guibg=NONE ctermbg=NONE
autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE
autocmd vimenter * hi GitGutterAdd guibg=NONE ctermbg=NONE
autocmd vimenter * hi GitGutterChange guibg=NONE ctermbg=NONE
autocmd vimenter * hi GitGutterDelete guibg=NONE ctermbg=NONE
autocmd vimenter * hi Directory guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=NONE guibg=NONE
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app'
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum
  set termguicolors
endif

" Turn off search highlights
nnoremap ,<space> :nohlsearch<CR>

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:set list
hi SpecialKey ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" FZF options
" Предварительно установить https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_OPTS    = '--reverse'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"
map <Leader>ff :Files<CR>
map <Leader>fb :BLines<CR>
map <Leader>fa :Rg<CR>

" map nerdtree to the ctrl+\
function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
nnoremap <Leader>nn :call NerdTreeToggleFind()<CR>
let NERDTreeShowHidden=1

" COC
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-pyright'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  "let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html PrettierAsync

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Window navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
