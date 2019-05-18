call plug#begin('~/.local/share/nvim/plugged')
"Loading plugins
"==========================================================

"Themes
Plug 'chriskempson/base16-vim'
Plug 'jmakip/lightline.vim'

"Go plugin
Plug 'fatih/vim-go'

"Improved syntax hilight
Plug 'justinmk/vim-syntax-extra'

"Git wrapper
Plug 'tpope/vim-fugitive'

"automatic ctags/gtags
Plug 'jsfaint/gen_tags.vim'

"Code complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

call plug#end()


"Settings
"=========================================================

set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically refresh changed files 
set autoindent                  
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     " Enable mouse mode

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows

set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmode               " StatusLine has mode, 
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 

set termguicolors
syntax on
colorscheme base16-gokukai


" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }


let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
let g:go_info_mode = "gocode"

let g:go_def_mode = "godef"
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []


"Indent by filetype
"==========================================================
augroup filetypedetect
  
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
  
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
"toybox has weird 2 space tabs 
  autocmd FileType c setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType cpp setlocal expandtab shiftwidth=4 tabstop=4
augroup END

"Show git branch on statusline
"==========================================================
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ 'colorscheme' : 'base16_default',
\ }
function! LightlineFilename()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

"Keybindings
"========================================================
let mapleader = ","
" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Nvim terminal
tnoremap <Esc> <C-\><C-n>


"jump to def with gd
nnoremap gd <C-]>
