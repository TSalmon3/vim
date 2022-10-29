vim9script
##  may vim run control file

## basic config
set noswapfile
set ruler
set number
set relativenumber
set textwidth=80
set wrap
set linebreak
set sidescrolloff=15
set cursorline
set nocompatible
set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set laststatus=2
set wrapmargin=2
set updatetime=100

filetype indent on
syntax on
set background=dark
colorscheme gruvbox

## keymap

g:mapleader = ","
g:localmapleader = "<space>"


### windows split

nnoremap sv :vsplit<cr>
nnoremap sh :split<cr>
### window close
nnoremap sc :quit<cr>
### window toggle
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
### window resize
nnoremap <C-Left> :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>
nnoremap <C-Up> :resize -2<cr>
nnoremap <C-Down> :resize +2<cr>

### Upper the word
inoremap <c-u> <esc>viwUea

### Fast to exit insert/visual mode
inoremap jk <esc>
vnoremap jk <esc>

### Fast open and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


##autocmd
autocmd FileType c nnoremap <buffer> <localleader>c i//<esc>
autocmd FileType c iabbrev <buffer> iff if()<left>

##augroup
augroup testgroup
    autocmd BufWrite * :echom "hello world"
augroup END

## abbrev
abbrev @@ tsalmon3@163.com


## plugin
plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/vim-quickui'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/LeaderF'
plug#end()

### plugin/coc
g:coc_global_extension = [
            \ 'coc-json',
            \ 'coc-clangd',
            \ 'coc-vimlsp']

# Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
# Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
# delays and poor user experience.
set updatetime=300
# Always show the signcolumn, otherwise it would shift the text each time
# diagnostics appear/become resolved.
set signcolumn=yes
# Use tab for trigger completion with characters ahead and navigate.
# NOTE: There's always complete item selected by default, you may want to enable
# no select by `"suggest.noselect": true` in your configuration file.
# NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
# other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

# Make <CR> to accept selected completion item or notify coc.nvim to format
# <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

def CheckBackspace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
enddef

# Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

# Use `[g` and `]g` to navigate diagnostics
# Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <space>- <Plug>(coc-diagnostic-prev)
nmap <silent> <space>= <Plug>(coc-diagnostic-next)

# GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

# Use K to show documentation in preview window.
nnoremap <silent> <space>h :call ShowDocumentation()<CR>

def ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    CocActionAsync('doHover')
  else
    feedkeys('K', 'in')
  endif
enddef

# Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


### plugin/vim-devicons
g:webdevicons_enable = 1
g:webdevicons_enable_nerdtree = 1
g:webdevicons_enable_airline_tabline = 1
g:webdevicons_enable_starify = 1

### plugin/leaderf config
g:lf_GtagsAutoGenerater = 1
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


### plugin/vim-quickui config
quickui#menu#reset()
quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0'],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

quickui#menu#install('&Plugin', [
            \ ["&NerdTree\tCtrl+e", 'NERDTreeToggle'],
            \ ["&WhickKey\t<Space>", 'WhichKey '','''],
            \ ["--", ''],
            \])

g:quickui_show_tip = 1
noremap <space><space> :call quickui#menu#open()<cr>

### plugin/airline config
g:airline#extensions#tabline#enabled = 1
g:airline_theme = 'gruvbox'
g:airline_left_sep = ''
g:airline_left_alt_sep = ''
g:airline_right_sep = ''
g:airline_right_alt_sep = ''


if !exists('g:airline_symbols')
    g:airline_symbols = {}
endif

g:airline_symbols.branch = ''
g:airline_symbols.colnr = ' ℅:'
g:airline_symbols.readonly = ''
g:airline_symbols.linenr = ' :'
g:airline_symbols.maxlinenr = '☰ '
g:airline_symbols.dirty = '⚡'

### plugin/nerdtree config
nnoremap <c-e> :NERDTreeToggle<CR>

### plugin/which-key config
set timeoutlen=500
nnoremap <space> :<c-u>WhichKey '<leader>'<cr>

#### Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

#### Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


### plugin/easymotion config
noremap <leader> <Plug>(easymotion-prefix)

#### <Leader>f{char} to move to {char}
noremap  <leader>f <Plug>(easymotion-bd-f)
nnoremap <leader>f <Plug>(easymotion-overwin-f)

#### s{char}{char} to move to {char}{char}
nnoremap s <Plug>(easymotion-overwin-f2)

#### Move to line
noremap <leader>L <Plug>(easymotion-bd-jk)
nnoremap <leader>L <Plug>(easymotion-overwin-line)

#### Move to word
noremap  <leader>w <Plug>(easymotion-bd-w)
nnoremap <leader>w <Plug>(easymotion-overwin-w)
