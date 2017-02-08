function! AcceptAllRight() abort
  let i = 0
  let n = 0
  g/>>>>/let n=n+1

  execute 'normal! gg'
  while i < n+1 
    execute 'normal! ]c'
    execute 'diffget //3'
    execute 'diffupdate'

    let i += 1
  endwhile
endfunction

function! AcceptAllLeft() abort
  let i = 0
  let n = 0
  g/>>>>/let n=n+1
  
  execute 'normal! gg'
  while i < n+1 
    execute 'normal! ]c'
    execute 'diffget //2'
    execute 'diffupdate'
    let i += 1
  endwhile
endfunction


function! AcceptLeft() 
  execute 'diffget //2'
  execute 'normal! ]c'
  execute 'diffupdate'
endfunction

function! AcceptRight() 
  execute 'diffget //3'
  execute 'normal! ]c'
  execute 'diffupdate'
endfunction

nnoremap <expr> ar &diff ? ':call AcceptRight()<cr>' : 'ar'
nnoremap <expr> al &diff ? ':call AcceptLeft()<cr>' : 'al'

command! AcceptAllRight call AcceptAllRight()
command! AcceptAllLeft call AcceptAllLeft()
command! AcceptRight call AcceptRight()
command! AcceptLeft call AcceptLeft()
