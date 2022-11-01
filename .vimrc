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

filetype plugin on

filetype indent on
syntax on
set background=dark
colorscheme gruvbox

## keymap

g:mapleader = ","
g:localmapleader = "<space>"

### scroll up/down in window
nnoremap K 2<c-y>
nnoremap J 2<c-e>

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

### open terminal in new windows
nnoremap tt :vertical terminal<cr>
tnoremap tt <c-\><c-n>:q!<cr>

### switch between terminal win to nerdtree win or editor win
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
plug#end()

### plugin/coc
g:coc_global_extension = [
            \ 'coc-json',
            \ 'coc-clangd',
            \ 'coc-vimlsp',
            \ 'coc-translator',
            \ 'coc-snippets']

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

def CheckBackspace(): bool
  var col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
enddef

# Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

# Use `[g` and `]g` to navigate diagnostics
# Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> g[ <Plug>(coc-diagnostic-prev)
nnoremap <silent> g] <Plug>(coc-diagnostic-next)
nnoremap <silent> ge <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> gE <Plug>(coc-diagnostic-next-error)
nnoremap <silent> da :CocDiagnostics<cr>

# GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

# GoTo diagnostic 
# nnoremap <silent> g] <Plug>(coc-diagnostic-next)
# nnoremap <silent> g[ <Plug>(coc-diagnostic_prev)
# nnoremap <silent> ge <Plug>(coc-diagnostic_next_error)
# nnoremap <silent> gE <plug>(coc-diagnostic_prev_error)
# nnoremap <silent> da <Plug>(coc-list-diagnostics)

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

### coc/translator
nnoremap tr <Plug>(coc-translator-p)


### plugin/nerdcommenter
g:NERDSpaceDelims = 1
g:NERDCreateDefaultMappings = 1
nnoremap <leader>cc <Plug>NERDCommenterComment
nnoremap <leader>c$ <Plug>NERDCommenterToEOL
nnoremap <leader>cn <Plug>NERDCommenterNested
nnoremap <leader>cu <Plug>NERDCommenterUnComment
vnoremap <leader>cc <Plug>NERDCommenterComment
vnoremap <leader>c$ <Plug>NERDCommenterToEOL
vnoremap <leader>cn <Plug>NERDCommenterNested
vnoremap <leader>cu <Plug>NERDCommenterUnCommevn



### plugin/markdown-preview.nvim
nnoremap <F8> <Plug>MarkdownPreviewToggle
inoremap <F8> <Plug>MarkdownPreviewToggle

### plugin/vim-rooter
g:rooter_targets = '/,*'
g:rooter_patterns = ['.git']
g:rooter_manual_only = 1
g:rooter_cd_cmd = "cd"
g:rooter_silent_chdir = 0
nnoremap cd :Rooter<cr> :NERDTreeCWD<cr>

### plugin/vim-visual-multi
g:VM_maps = {}
g:VM_maps["Find Under"] = '<c-n>'
g:VM_maps["Find Subword Under"] = '<c-n>'
g:VM_maps["Find Next"] = 'n'
g:VM_maps["Find Prev"] = 'N'
g:VM_maps["Remove Region"] = 'q'
g:VM_maps["Skip Region"] = 'Q'
g:VM_maps["Select Cursor Down"] = '<c-j>'
g:VM_maps["Select Cursor Up"] = '<c-k>'
g:VM_maps["Increase"] = '='
g:VM_maps["Decrease"] = '-'
g:VM_maps["Undo"] = 'u'
g:VM_maps["Redo"] = '<c-r>'



### plugin/rainbow
g:rainbow_active = 1
g:rainbow_conf = {
\       'separately': {
\               'nerdtree': 0,
\       }
\}

### plugin/vim-devicons
g:webdevicons_enable = 1
g:webdevicons_enable_nerdtree = 1
g:webdevicons_enable_airline_tabline = 1
g:webdevicons_enable_airline_statusline = 1
g:webdevicons_enable_starify = 1

### plugin/leaderf config
g:Lf_GtagsAutoGenerater = 1
g:Lf_RootMarkerts = ['.git']
nnoremap <c-f> :Leaderf rg<cr>
nnoremap <c-p> :Leaderf file<cr>
nnoremap tg :Leaderf gtags --update<cr>
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

g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>0 <Plug>AirlineSelectTab0

nnoremap <leader>- <Plug>AirlineSelectPrevTab
nnoremap <leader>= <Plug>AirlineSelectNextTab
### plugin/nerdtree config
nnoremap te :NERDTreeToggle<CR>

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
