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
set cinkeys-=0#           " Ignore indent for '#' as the first character in a line
set backupcopy=yes
"set scrolloff=2
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

" Set key map timeouts
"set notimeout
set ttimeoutlen=200    " 1000 = 1 second

"==================== Advanced settings ====================
" Use true color
if (has("termguicolors"))
  set termguicolors
endif

"==================== Make Neovim with python support ====================
" Need to installe Python3 first, and then run `py -3 -m pip install pynvim`.
" Execute `:checkhealth` for vim health checks to see python support status.
" Set Python path
"let g:python3_host_prog = "C:/Python39/python.exe"
let g:python3_host_prog = "python.exe"    " Need to Add python folder in your PATH system variable


"==================== Leader key ====================
" Set your leader key. The default leader key is '\'

"-------- Use `;` as leader key --------
"let mapleader = ';'
"map <S-F1> :WhichKey ';'<CR>

"-------- Use <SPACE> as leader key --------
nnoremap <space> <Nop>
let mapleader = ' '
map <S-F1> :WhichKey ' '<CR>

"==================== Plugin manager ====================
"-------- Specify a directory for plugins --------
call plug#begin('~/AppData/Local/nvim/plugged')

"-------- Basic Plugins --------
Plug 'nvim-lua/plenary.nvim'       " For asynchronous jobs, Neovim only
Plug 'nvim-tree/nvim-web-devicons' " File type icons, need Nerd Fonts
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-scripts/mru.vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'     " Status line
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'     " File tree
Plug 'majutsushi/tagbar',          {'on': 'TagbarToggle'}
Plug 'godlygeek/tabular',          {'on': 'Tabularize'}
Plug 'akinsho/toggleterm.nvim',    {'on': 'ToggleTerm'}
Plug 'tmsvg/pear-tree'
Plug 'preservim/vim-markdown'
Plug 'sukima/xmledit'
Plug 'yuttie/comfortable-motion.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-quickui'
Plug 'skywind3000/vim-terminal-help'
Plug 'kevinhwang91/nvim-bqf'
Plug 'fidian/hexmode'

"-------- Search and replace --------
" rg.exe need to be in Windows PATH system variable (https://github.com/BurntSushi/ripgrep)
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'  " Project Manager

"-------- Auto completion --------
" Plug 'ervandew/supertab'
Plug 'vim-scripts/OmniCppComplete'

" -- Use nvim-cmp for complete --
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"-------- Color scheme --------
Plug 'ishan9299/nvim-solarized-lua'

"-------- Initialize plugin system --------
call plug#end()

" ---- Setup for lua plugins ----
" -- telescope related --
lua require('telescope').load_extension('project')

lua << EOF
require('telescope').setup {
    defaults = {
        path_display={"truncate"}
    }
}
EOF


" -- nvim-tree --
lua << EOF
require("nvim-tree").setup {
    git = {
        enable = false
    }
}
EOF

" -- toggleterm --
lua << EOF
require("toggleterm").setup {
    shade_terminals = false
}
EOF

" -- nvim-cmp --
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {"i","s","c",}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {"i","s","c",}),
    },

    sources = cmp.config.sources({
      { name = 'buffer' },
      { name = 'omni' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF


"==================== Plugin settings ====================
" ---- color scheme ----
colorscheme solarized-flat     " default, solarized-flat
set background=dark            " dark, light

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
let g:NERDCustomDelimiters = {
            \ 'c': { 'left': '//'},
            \ 'python': { 'left': '#', 'right': '' },
            \ }

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

" ---- pear-tree ----
let g:pear_tree_repeatable_expand = 0

" ---- OmniCppComplete ----
let OmniCpp_SelectFirstItem = 0
let OmniCpp_ShowPrototypeInAbbr = 1

" ---- supertab ----
let g:SuperTabDefaultCompletionType = "<c-n>"     " Navigate the completion menu from top to bottom
let g:SuperTabCrMapping = 1

" ---- MRU ----
let MRU_Window_Height = 20


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


"==================== Function keymap ====================

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

" For ctags jump
nnoremap <leader>] <C-]>
nnoremap <leader>g 2<C-]>
nnoremap <leader>t <C-T>

" Keymap for w
nnoremap <leader>wl   :SessionList<CR>
nnoremap <leader>ww   :SessionSave<CR>
nnoremap <leader>wt   :ToggleTerm<CR>

" Switch to the path of current editing file
nnoremap <leader>wd   :cd %:p:h <BAR> pwd<CR>

nnoremap <silent> <leader>wh       :nohlsearch<CR>  " Clean search (highlight)
nnoremap <silent> <leader>wq       :copen<CR>       " Open quickfix window
nnoremap <silent> <leader>wf       :cclose<CR>      " Close quickfix window

" File tree, Taglist and proejct
nnoremap <leader>e  :NvimTreeToggle <CR>
nnoremap <leader>p  :Telescope project<CR>
nnoremap <leader>l  :TagbarToggle<CR>

" Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fc :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

" Find shortcut
nnoremap <C-f>      :/
nnoremap <S-C-f>    :Telescope live_grep<CR>

" ^M - convert to dos format for mix line ending file
nnoremap <leader>fd :!unix2dos "%" <CR> <BAR> :e <CR>

" Preview for markdown
" Firefox markdown extension needed: [markdown-viewer](https://github.com/KeithLRobertson/markdown-viewer)
nnoremap <silent> <leader>md :silent !start firefox "%"<CR>

map <F3>   :execute "Rg -w" expand("<cword>") "%"<CR>
map <S-F3> :execute "Rg -w" expand("<cword>")<CR>
map <F4>   :execute "Rg -w -tc" expand("<cword>") "%"<CR>
map <S-F4> :execute "Rg -w -tc" expand("<cword>")<CR>

" Quick run via <F5>
map <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    :wall
    if &filetype == 'c'
        :TermExec cmd="gcc % -o %<.exe && %<.exe"
    elseif &filetype == 'cpp'
        :TermExec cmd="g++ % -o %<.exe && %<.exe"
    elseif &filetype == 'python'
        :TermExec cmd="python %"
    endif
endfunction

map <F7>   :NvimTreeToggle<CR>
map <F8>   :TagbarToggle<CR>

" Shortcut for sessionman.vim. Close NERDTree and Tagbar before saving a session.
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

:command Terminal          :ToggleTerm

" Close other buffers or use `:tabonly` to close other tabs
:command CloseOtherBuffers :silent %bd | e#

" Workaround for Quickfix window opens inside Tagbar window
"autocmd FileType qf wincmd J
:command Copen             :botright copen

" ==================== User menu ====================
runtime quickui_menu.vim

