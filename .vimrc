vim9script
##  may vim run control file

## basic config
set noswapfile
set ruler
set number
set relativenumber
set textwidth=80
set cc=+1
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
set tabstop=8
set shiftwidth=8
set expandtab
set softtabstop=8
set laststatus=2
set wrapmargin=2
set updatetime=100
set incsearch
set hlsearch
set nocompatible

filetype plugin on

filetype indent on
syntax on
set background=dark
colorscheme gruvbox


## keymap

g:mapleader = ","
g:localmapleader = "<space>"

### fix alt isn't working 
map <esc>h <a-h>
map <esc>j <a-j>
map <esc>k <a-k>
map <esc>l <a-l>

map <esc>p <a-p>
map <esc>f <a-f>
map <esc>g <a-g>
map <esc>m <a-m>
map <esc>s <a-s>
map <esc>w <a-w>

map <esc>d <a-d>

map <esc>o <a-o>

### save 
nnoremap <c-s> :w<cr>

### scroll up/down in window
nnoremap K 2<c-y>
nnoremap J 2<c-e>

### windows split
nnoremap sv :vsplit<cr>
nnoremap sh :split<cr>

### window close
nnoremap sc :quit<cr>

### window toggle
nnoremap <a-h> <C-w>h
nnoremap <a-j> <C-w>j
nnoremap <a-k> <C-w>k
nnoremap <a-l> <C-w>l

### window resize
nnoremap <a-Left> :vertical resize -2<cr>
nnoremap <a-Right> :vertical resize +2<cr>
nnoremap <a-Up> :resize -2<cr>
nnoremap <a-Down> :resize +2<cr>

### Upper the word
inoremap <leader>u <esc>viwUea

### Fast to exit insert/visual mode
inoremap jk <esc>
vnoremap jk <esc>

### Fast open and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

### open terminal in new windows
# nnoremap <silent>tt :vertical terminal<cr>
# noremap <silent>tl :vertical terminal<cr> lazygit<cr>
# tnoremap <silent>tt <c-\><c-n>:q!<cr>

### switch between terminal win to nerdtree win or editor win
tnoremap <a-j> <c-w>j
tnoremap <a-k> <c-w>k
tnoremap <a-h> <c-w>h
tnoremap <a-l> <c-w>l

##
nnoremap <leader>x :%!xxd<cr>

##autocmd
autocmd FileType c nnoremap <buffer> <localleader>c i//<esc>
autocmd FileType c iabbrev <buffer> iff if()<left>

##augroup

## abbrev
abbrev @@ tsalmon3@163.com


## plugin
plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/potion'
Plug 'octol/vim-cpp-enhanced-highlight'
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
# Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/gv.vim'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'yegappan/mru'
Plug 'liuchengxu/vista.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'vimwiki/vimwiki'
plug#end()

### plugin/startify
g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ ]

g:startify_bookmarks = ['~/OneDrive/Document/Obsidian/bookmark/index.md']

nnoremap <leader>ss :SSave<cr>
nnoremap <leader>sc :SClose<cr>

### plugin/vimwiki
var blog = {}
blog.path = "~/OneDrive/Document/Obsidian/bookmark"
blog.syntax = 'markdown'
blog.ext = '.md'
blog.auto_tags = 1

g:vimwiki_list = [blog]
g:vimwiki_global_ext = 0
g:vimwiki_auto_chdir = 1

nnoremap <a-w> :VimwikiSearch :

# g:vimwiki_list = [{'path': '~/OneDrive/Document/Obsidian/blog/'}]

### plugin/vim-autoformat
nnoremap <F3> :AutoFormat<CR>
au BufWrite *.c :Autoformat

### plugin/vista.vim
g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
g:vista#renderer#enable_icon = 1
g:vista_highlight_whole_line = 1
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif
nnoremap ta :Vista ctags<cr>
nnoremap txa :Vista!<cr>


### plugin/vim-cpp-enhanced-highlight(syntax highlight)
g:cpp_member_variable_highlight = 1

### plugin/vim-markdown
g:vim_markdown_folding_disable = 1

### plugin/MRU
g:MRU_Window_Height = 15
nnoremap <a-m> :botright MRUToggle<cr> 


### plugin/vimspector
g:vimspector_install_gadgets = ['CodeLLDB']

nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>de :call vimspector#Reset()<cr>
nnoremap <leader>dc :call vimspector#Continue()<cr>

nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<cr>

nmap <leader>dk <Plug>VimspectorRestart
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>dl <Plug>VimspectorSetpInto
nmap <leader>dj <Plug>VimspectorSetpOver


### plugin/vim-floaterm
g:floaterm_height = 0.8
g:floaterm_width = 0.8
g:floaterm_autoclose = 2
# g:floaterm_wintype = 'vsplit'
# g:floaterm_position = 'right'

nnoremap <F1> :FloatermToggle --cwd=<root><cr>
tnoremap <F1> <C-\><C-n>:FloatermToggle --cwd=<root><cr>

nnoremap tt :FloatermToggle<cr>
nnoremap txt :FloatermKill<cr>
tnoremap tt <C-\><C-n>:FloatermToggle<cr>

### plugin/ale

g:ale_disable_lsp = 1
g:ale_sign_error = ''
g:ale_sign_warning = ''
g:ale_echo_msg_error_str = ''
g:ale_echo_msg_warning_str = ''
g:ale_echo_msg_format = '[%severity%][%linter%] %s'
nnoremap <silent> ]e <plug>(ale_next_wrap)
nnoremap <silent> [e <plug>(ale_previous_wrap)

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
# nnoremap <silent> g[ <Plug>(coc-diagnostic-prev)
# nnoremap <silent> g] <Plug>(coc-diagnostic-next)
# nnoremap <silent> ge <Plug>(coc-diagnostic-prev-error)
# nnoremap <silent> gE <Plug>(coc-diagnostic-next-error)
nnoremap <silent> <a-d> :CocDiagnostics<cr>

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
nnoremap <silent> K :call ShowDocumentation()<CR>

def ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    CocActionAsync('doHover')
  else
    feedkeys('K', 'in')
  endif
enddef

# Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

# Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

### coc/translator
nnoremap tr <Plug>(coc-translator-p)


### plugin/startify
nnoremap <a-s> :Startify<cr>

### plugin/auto-pair
g:AutoPairsShortcutToggle = '<c-p>'

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
vnoremap <leader>cu <Plug>NERDCommenterUnComment


### plugi<space>n/markdown-preview.nvim
g:mkdp_brower = 'chrominum'
nnoremap <F8> <Plug>MarkdownPreviewToggle
inoremap <F8> <Plug>MarkdownPreviewToggle

### plugin/vim-rooter
g:rooter_targets = '/,*'
g:rooter_patterns = ['.git']
g:rooter_manual_only = 1
g:rooter_cd_cmd = "cd"
g:rooter_silent_chdir = 0
nnoremap cd :Rooter<cr> :NERDTreeCWD<cr> :NERDTreeToggle<cr>

### plugin/vim-visual-multi
g:VM_maps = {}
g:VM_maps["Exit"] = '<esc>'
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
g:webdevicons_enable_startify = 1

### plugin/Leaderf config
#g:Lf_WindowPosition = 'popup'
g:Lf_GtagsAutoGenerater = 1
g:Lf_RootMarkerts = ['.git']
nnoremap <a-f> :Leaderf rg -i<cr>
nnoremap <a-p> :Leaderf file<cr>
# nnoremap <a-m> :Leaderf mru<cr>
nnoremap <a-g> :Leaderf gtags --update<cr> :Leaderf gtags<cr>
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

g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tabline#left_sep = ''

g:airline#extensions#coc#enabled = 0
g:airline#extensions#ale#enabled = 1
g:airline#extensions#ale#error_symbol = ''
g:airline#extensions#ale#warning_symbol = ''

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
g:EasyMotion_do_mapping = 0
g:EasyMotion_smartcase = 0
noremap <leader> <Plug>(easymotion-prefix)

#### <Leader>f{char} to move to {char}
noremap  mf <Plug>(easymotion-bd-f)
nnoremap mf <Plug>(easymotion-overwin-f)

#### s{char}{char} to move to {char}{char}
nnoremap ms <Plug>(easymotion-overwin-f2)

#### Move to line
noremap ml <Plug>(easymotion-bd-jk)
nnoremap ml <Plug>(easymotion-overwin-line)

#### Move to word
noremap  mw <Plug>(easymotion-bd-w)
nnoremap mw <Plug>(easymotion-overwin-w)

### Plugin/fugitive
### Plugin/gv.vim
noremap <leader>gv :GV<cr>
