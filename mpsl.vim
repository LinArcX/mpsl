scriptencoding utf-32
au InsertEnter * hi statusline guibg=#ff5faf guifg=#000000 ctermbg=206 ctermfg=016
au CmdwinEnter * hi statusline guibg=#5fafd7 guifg=#000000 ctermbg=074 ctermfg=016
au CmdwinLeave * hi statusline guibg=#5f875f guifg=#c0c0c0 ctermbg=065 ctermfg=007
au InsertLeave * hi statusline guibg=#5f875f guifg=#c0c0c0 ctermbg=065 ctermfg=007
au BufWrite * hi statusline guibg=#5f875f guifg=#000000 ctermbg=065 ctermfg=007
hi statusline guibg=#5f875f guifg=#c0c0c0 ctermbg=065 ctermfg=007

let g:currentmode={
            \ 'n'  : 'Normal', 'no' : 'Normal·Operator Pending',
            \ 'v'  : 'Visual', 'V'  : 'V·Line', '^V' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line', '^S' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace', 'Rv' : 'V·Replace',
            \ 'c'  : 'Command', 'cv' : 'Vim Ex', 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \ 't'  : 'Terminal'
            \}

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    if (match(l:modelist,"NORMAL") == 0)
        exe 'hi! statusline guibg=#5f875f guifg=#c0c0c0 ctermbg=065 ctermfg=007'
    elseif (match(l:modelist,"VISUAL") == 0)
        exe 'hi! statusline guibg=#af8700 guifg=#000000 ctermbg=137 ctermfg=016'
    elseif (match(l:modelist,"V.BLOCK") == 0)
        exe 'hi! statusline guibg=#af8700 guifg=#000000 ctermbg=137 ctermfg=016'
    elseif (match(l:modelist,"INSERT") == 0)
        exe 'hi! statusline guibg=#ff5faf guifg=#000000 ctermbg=206 ctermfg=016'
    elseif (match(l:modelist,"COMMAND") == 0)
        exe 'hi! statusline guibg=#5fafd7 guifg=#000000 ctermbg=074 ctermfg=016'
    else
        exe 'hi! statusline guibg=#5f875f guifg=#c0c0c0 ctermbg=065 ctermfg=007'
    endif
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif
    if bytes <= 0
        return '0'
    endif
    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction

set laststatus=2
set statusline+=%0*\ %{ModeCurrent()}\ |
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%2*\ %=                                  " Space
set statusline+=%7*
set statusline+=%3*\ %{ReadOnly()}\ |
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%1*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%1*\ %3p%%\ \ %l:\%3c\                  " Rownumber/total (%)

hi User1 guibg=#303030 guifg=#c0c0c0 ctermbg=236 ctermfg=007 " Grey/Silver
hi User2 guibg=#4e4e4e guifg=#c0c0c0 ctermbg=239 ctermfg=007 " Grey/Silver
hi User3 guibg=#4e4e4e guifg=#d7d770 ctermbg=239 ctermfg=184 " Grey/Yello
