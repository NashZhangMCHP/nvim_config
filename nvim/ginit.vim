" Start nvim with start maximized window
call GuiWindowMaximized(1)

" Use default text-based tab line
GuiTabline 0

" Use default popup menu
GuiPopupmenu 0

" Set GUI font, and enable to adjust fontsize with mouse
GuiFont! Consolas:h11

let s:fontsize = 11
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
