" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

set shell=/usr/bin/zsh

if $TERM == "xterm-256color"
  set t_Co=256
endif
let mapleader = " " " map leader to Space
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc3.8

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"split navigations
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

"nnoremap l <Nop>
"nnoremap h <Nop>
"nnoremap k <Nop>
"nnoremap j <Nop>

"vim package manager
call plug#begin('~/.vim/plugged')

" great commenting tool, helps to comment nad uncomment multiple lines
" Plug 'preservim/nerdcommenter'
Plug 'joom/vim-commentary'

"enable buffer closing without closing split window
Plug 'qpkorr/vim-bufkill'

" plugin for conda and vim config
Plug 'cjrh/vim-conda'

"easy file finder, mapped to control f
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"better code folding
Plug 'tmhedberg/SimpylFold'

"git integration for vim
Plug 'tpope/vim-fugitive'

"indicator of what has been added since last git commit
Plug 'airblade/vim-gitgutter'

"nerdtoggle
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'

"plugin for cool status bar
Plug 'vim-airline/vim-airline'

" cool side bar
" Snippets are separated from the engine. Add this if you want them:, need it
" for ultisnips
" snippet manager engine
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"go to definition, linting, completion support
Plug 'dense-analysis/ale'

" helpful indent guides
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'davidhalter/jedi-vim'
Plug 'bling/vim-bufferline'


call plug#end()

" enter command mode for terminal
:tnoremap hh <C-\><C-n>

set foldlevelstart=20


" dont show .pyc files in nerd tree
let NERDTreeIgnore = ['\.pyc$','__pycache__']

" put arrow maps here
" https://codingfearlessly.com/vim-putting-arrows-to-use

" do not automatically wrap on load
set nowrap     

" fixes issues with indents when copy and paste
" data from outside teminal VERY HELPFUL
if &term =~ "screen"                                                   
    let &t_BE = "\e[?2004h"                                              
    let &t_BD = "\e[?2004l"                                              
    exec "set t_PS=\e[200~"                                              
    exec "set t_PE=\e[201~"                                              
endif

"write automatically after leave insert
autocmd InsertLeave * write

"set shortcut to move between buffers within one window
set hidden

nnoremap <C-P> :bprev<CR>
" fuzzy find files
nnoremap <leader>f :Files<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" nnoremap <space> za

" jedi defaults 
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_stubs_command = "<leader>s"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set completeopt=menuone,noinsert
let g:ale_sign_error = 'e'
let g:ale_sign_warning = 'w'
let g:ale_fix_on_save = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_hover_cursor = 0
" Want to only run linters on explict :AleInfo
" Running the linters causes lag in the vim window
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

let g:jedi#use_splits_not_buffers = "right"
" this causes some lag only want auto complete when
" invoked specificaly
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"

" this will disable autocomplete totally
" let g:jedi#completions_enabled = 0
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['black', 'autopep8', 'isort']


"custom split view c for custom
nmap <C-x> :vsp<CR><C-W><C-L>:ter<CR><C-\><C-n><C-W><C-H>
" access snippets
nmap <C-U><C-L> :UltiSnipsEdit<CR>
" show errors 
nmap <leader>L :ALELint<CR>
nmap <leader>R :ALEFix<CR>
nmap <leader>T :tabnew %<CR>
nmap <leader>t :term<CR>
nmap c :BD<CR>
nmap q :q<CR>
nmap s :w<CR>
nmap Q :qa!<CR>
nmap <F1> :source ~/.vimrc<CR>
map <leader>n :NERDTreeToggle<CR>
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

let g:bufferline_echo = 1
let g:conda_startup_msg_suppress = 1
let g:indent_guides_enable_on_vim_startup = 1

syntax enable
set background=dark
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_section_b=''
let g:airline_extensions = []
set statusline+=%f

"close vim if only thing open is nerd toggle
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

