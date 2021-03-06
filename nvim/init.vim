"==================== Basic settings ====================
set nocompatible

" Enable Windows behaviour and mouse
runtime mswin.vim

if has('mouse')
    set mouse=a
endif

" Common settings
set number
set noswapfile
set nobackup
set noundofile
set shiftwidth=4
set tabstop=4
set expandtab
set wrap
set linebreak
set foldmethod=indent
set foldlevelstart=99
set ignorecase
set smartcase
set history=100           " Command history
set sessionoptions-=blank " Ignore NERDTree, Tagbar in session save
"set autochdir
"set colorcolumn=81
"set spell
"set list

" Set File encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" No show preview window for completion
set completeopt-=preview

" Set autoread when a file is changed outside
"set autoread
autocmd FocusGained * silent! checktime

" Auto save changes when vim automatically switch buffers
set autowrite

" Always show tabpage
"set showtabline=2

" Set key map timeouts
"set notimeout
set ttimeoutlen=200    " 1000 = 1 second

"==================== Advanced settings ====================
" Use true color
if (has("termguicolors"))
  set termguicolors
endif

"set t_Co=256

" Use ripgrep instead of vimgrep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
endif

"==================== Make Neovim with python support ====================
" Need to installe Python3 first, and then run `py -3 -m pip install pynvim`.
" Execute `:checkhealth` for vim health checks to see python support status.
" Set Python path
"let g:python_host_prog  = "C:/Python27/python.exe"
"let g:python3_host_prog = "C:/Python37/python.exe"
let g:python3_host_prog = "python.exe"    " Need to Add python in your PATH


"==================== Leader key ====================
" Set your leader key. The default leader key is '\'

"-------- Use `;` as leader key --------
let mapleader = ";"
map <S-F1> :WhichKey ';'<CR>


"==================== Plugin manager ====================
"-------- Specify a directory for plugins --------
call plug#begin('~/AppData/Local/nvim/plugged')

"-------- Basic Plugins --------
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-scripts/mru.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree',         { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'hari-rangarajan/CCTree'
Plug 'plasticboy/vim-markdown'
Plug 'mbbill/undotree'
Plug 'sukima/xmledit'
Plug 'yuttie/comfortable-motion.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-quickui'
Plug 'skywind3000/vim-terminal-help'

"-------- String search and replace --------
" rg.exe need to be in Windows env. PATH (https://github.com/BurntSushi/ripgrep)
Plug 'jremmen/vim-ripgrep'

"Plug 'brooth/far.vim'

"-------- Auto complete --------
Plug 'ervandew/supertab'
Plug 'vim-scripts/OmniCppComplete'

" deoplete.vim need python3 support
"let g:deoplete#enable_at_startup = 1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-tag'

"-------- Fuzzy file seach --------
" 'fzf.exe' need to be in Windows env. PATH (https://github.com/junegunn/fzf)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"-------- snippets --------
"Plug 'honza/vim-snippets'
"Plug 'sirver/UltiSnips'

"-------- git --------
"Plug 'tpope/vim-fugitive'


"-------- Color scheme --------
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'

"-------- Initialize plugin system --------
call plug#end()


"==================== Plugin settings ====================
" ---- color scheme ----
colorscheme solarized8_flat     " default, solarized8_flat, solarized8, PaperColor
set background=light            " dark, light

" ---- vim-airline ----
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline_theme='solarized'                        " solarized, bubblegum
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#buffer_nr_show = 1    " show buffer number
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " default, unique_tail_improved

"Show terminal in tabline
"https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt#L393-L403
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" ---- session manager ----
let sessionman_save_on_exit = 0


" ---- nerdcommenter ----
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }

" ---- vim-nerdtree-sync ----
let g:nerdtree_sync_cursorline = 1

" ---- Tagbar ----
let g:tagbar_sort = 0
let g:tagbar_width = 30

" Markdown support, see: https://github.com/majutsushi/tagbar/issues/70
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" ---- vim-markdown ----
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0

" ---- auto-pairs ----
let g:AutoPairsMapSpace = 0

" ---- OmniCppComplete ----
let OmniCpp_SelectFirstItem = 0
let OmniCpp_ShowPrototypeInAbbr = 1

" ---- supertab ----
let g:SuperTabDefaultCompletionType = "<c-n>"     " Navigate the completion menu from top to bottom
let g:SuperTabCrMapping = 1

" ---- MRU ----
let MRU_Window_Height = 20

" ---- fzf ----
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --c++-kinds=+p --fields=+niaS --extra=+q'

"==================== Map to navigate Windows easily ====================
" Use `ALT+{h,j,k,l}` to navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"==================== Function key map ====================

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" For comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_friction = 50.0
let g:comfortable_motion_air_drag = 10.0
nnoremap <C-j> :call comfortable_motion#flick(50)<CR>
nnoremap <C-k> :call comfortable_motion#flick(-50)<CR>

" Unmap CTRL-Y for undo in mswin.vim
unmap <C-Y>

" Disable pasting with the middle mouse button
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>

" Toggle netrw file explore on left window.
let g:netrw_winsize = 20
nnoremap <leader>e :Lexplore<CR>

" For ctags jump
nnoremap <leader>] <C-]>
nnoremap <leader>g 2<C-]>
nnoremap <leader>t <C-T>

" --- Key map for w(workspace) ----
nnoremap <leader>ww   :SessionSave<CR>
nnoremap <leader>wn   :NERDTreeToggle<CR>
nnoremap <leader>wt   :TagbarToggle<CR>
nnoremap <leader>wl   :SessionList<CR>

" Switch to the path of current editing file
nnoremap <leader>wd   :cd %:p:h <BAR> pwd<CR>

nnoremap <silent> <leader>wh       :nohlsearch<CR>  " Clean search (highlight)
nnoremap <silent> <leader>wq       :cclose<CR>      " Close quickfix window

" ^M - convert to dos format for mix line ending file
nnoremap <leader>fd :!unix2dos "%" <CR> <BAR> :e <CR>

" fzf
nnoremap <C-p>      :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>ft :Tags<CR>

" Preview for markdown
" Firefox markdown extension needed: [markdown-viewer](https://github.com/KeithLRobertson/markdown-viewer)
nnoremap <silent> <leader>md :silent !start firefox %<CR>

map <F3>   :execute "Rg -w" expand("<cword>") "%"<CR>
map <S-F3> :execute "Rg -w" expand("<cword>")<CR>
map <F4>   :execute "Rg -w -tc" expand("<cword>") "%"<CR>
map <S-F4> :execute "Rg -w -tc" expand("<cword>")<CR>

" Quick run via <F5>
map <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    if &filetype == 'c'
        :split | terminal gcc % -o %<.exe && %<.exe
    elseif &filetype == 'cpp'
        :split | terminal g++ % -o %<.exe && %<.exe
    elseif &filetype == 'python'
        :split | terminal python %
    endif
endfunction

map <F7>   :NERDTreeToggle<CR>
map <S-F7> :NERDTreeFind <BAR> wincmd l<CR> " Synchronize NERDTree with current opened file
map <F8>   :TagbarToggle<CR>

" Shortcut for sessionman.vim. Close NERDTree and Tagbar before saving a session.
map <S-F9>  :NERDTreeClose <BAR> TagbarClose<CR>
map <F9>  :SessionSave<CR>
map <F10> :SessionList<CR>

" Shortcut for tags
map <F11>   :AsyncRun cscope -bkR<CR>
map <S-F11> :!cscope -bkR<CR>
map <F12>   :AsyncRun ctags -R --c++-kinds=+p --fields=+niaS --extra=+q <CR>
map <S-F12> :AsyncRun ctags -R --c++-kinds=+p --fields=+niaS --extra=+q --exclude=@tags_exclude <CR>


"==================== User defined commands ====================
:command CopyFileName      silent let @+ = expand('%:t')
:command CopyFilePath      silent let @+ = expand('%:p:h')
:command CopyFileNameFull  silent let @+ = expand('%:p')

:command OpenFileLocation  :silent !start explorer /select, "%:p"<CR>

:command TrimTrailingSpace :%s /\s\+$//e | w
:command ShowColor         :runtime syntax/colortest.vim
:command Tab2Space         :set expandtab | retab
:command Space2Tab         :set noexpandtab | retab!

:command RemoveCtagfiles   :!rm -f tags cscope.out

:command CD2CurrentFile    :cd %:p:h
:command LCD2CurrentFile   :lcd %:p:h

:command GoFanyiBaidu      :silent !start firefox https://fanyi.baidu.com/\#en/zh/
:command GoWikipedia       :silent !start firefox https://en.wikipedia.org/wiki/

:command CmdWin            :silent !start cmd
:command GitBash           :!"C:\Program Files\Git\git-bash.exe"

" Close other buffers or use `:tabonly` to close other tabs
:command CloseOtherBuffers :silent %bd | e#

" Workaround for Quickfix window opens inside Tagbar window
"autocmd FileType qf wincmd J
:command Copen             :botright copen

" ==================== My cscope settings ====================
" Map for CCTree
nnoremap <leader><space>db :CCTreeLoadDB cscope.out<CR>
nnoremap <leader><space>dc :CCTreeTraceForward<CR><CR>
nnoremap <leader><space>dd :CCTreeTraceReverse<CR><CR>
nnoremap <leader><space>dt :CCTreeWindowToggle<CR>
nnoremap <leader><space>dp :CCTreeRecurseDepthPlus<CR>
nnoremap <leader><space>dm :CCTreeRecurseDepthMinus<CR>

" Map for cscope
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate
    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "

    nmap <leader><space>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><space>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><space>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><space>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><space>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><space>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader><space>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader><space>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" ==================== User menu ====================
runtime quickui_menu.vim
