
function! unite#sources#outline#cobol#outline_info()
  return s:outline_info
endfunction

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {
      \   'heading': '^.\{6}\s.*SECTION\.$\|^.\{6}\s.*CALL\|^.\{6}\s.*PERFORM\s\+\S\+$',
      \ }

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let section = substitute(a:heading_line, '\s\+SECTION\.$', '', '')
  let section = substitute(section, '^.\{7}' , '' , '')
  let level   = 1

  if a:heading_line =~ 'CALL\|PERFORM'
    let level = 2
  end

  let heading = {
        \ 'word' : section,
        \ 'level': level,
        \ 'type' : 'generic',
        \ }
  return heading
endfunction

" vim: filetype=vim
