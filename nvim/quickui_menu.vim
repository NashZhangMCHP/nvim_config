" ==================== Option ====================
" set color scheme
let g:quickui_color_scheme = 'borland'	" borland, solarized

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

" short key for preview_tag
nnoremap <space>]    :call quickui#tools#preview_tag('')<cr>
nnoremap <space>[    :call quickui#preview#close()<cr>

" ==================== Tips ====================
" shortkey for tips textbox
nnoremap <space>tt    :call quickui#textbox#open(tips_content, tips_opts)<cr>

let tips_x = " \n
	\ Upper<->lower: guW, gUw, Number + '~' \n\n
	\ Column edit: ctrl+Q, j..., A or I, ESC \n\n
	\ %!xxd, %!xxx-r \n\n
	\ :'<,'>!python  \n\n
	\ Run %LOCALAPPDATA% in Windows file explorer to open ~/AppData/Local/ folder.\n
	\ Type shell:sendto in the run box. Then OK. That opens the 'sendto' folder.\n
	\ "

let tips_content = filter(split(tips_x, "\n"), 'v:key != ""')
let tips_opts = {"close":"button", "title":"Vim Tips"}

" ==================== Menus ====================

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
			\ ["&Tutorial",   'Tutor', "Show Vim Tutor"],
			\ ["&New File",   'new' ],
			\ ["&Open File",  'e.' ],
			\ ["&Close File", 'bd' ],
			\ ["--", '' ],
			\ ["&Save",     'w' ],
			\ [ "Save &As", 'call feedkeys(":saveas ")' ],
			\ ["Save All", 'wa' ],
			\ ["--", '' ],
			\ ["Save and &Exit",     'wq' ],
			\ ["E&xit without Save", 'q!' ],
			\ ])

" install a 'Edit' menu
" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
			\ ['&Find',                'execute "Rg -w" expand("<cword>") "%"'],
			\ ['Find in File&s',       'execute "Rg -w" expand("<cword>")'],
			\ ['&Trim Trailing Space', '%s /\s\+$//e | w'],
			\ ['Toggle &deoplete',     'call deoplete#toggle()'],
			\ ])

" install a 'View' menu
call quickui#menu#install('&View', [
			\ ['&NerdTree Toggle', 'NERDTreeToggle'],
			\ ['&Tagbar Toggle',   'TagbarToggle'],
			\ ])

" install a 'C/C++' menu
call quickui#menu#install('&C/C++', [
			\ ['&Find',                 'execute "Rg -w" expand("<cword>") "%"'],
			\ ['Find in C/CPP File&s',  'execute "Rg -tc -s -w" expand("<cword>")'],
			\ ['Function L&ist',        'call quickui#tools#list_function()'],
			\ ], '<auto>', 'c, cpp')

" install a 'Option' menu
" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['&Open Startup Setting',            'edit ~/AppData/Local/nvim'],
			\ ['&Color Scheme',                    'Colors'],
			\ ['Set Dark Background',              'set bg=dark | call QuickThemeChange("")'],
			\ ['Set Light Background',             'set bg=light | call QuickThemeChange("")'],
			\ ])

" install HELP menu
call quickui#menu#install('Hel&p', [
			\ ['&Main Help File',  'help'],
			\ ["&Tutorial",        'Tutor'],
			\ ["&Check Health",    'checkhealth'],
			\ ["&Update Plugins",  'PlugUpdate'],
			\ ["&Version",         'version'],
			\ ])


