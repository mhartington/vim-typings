"============================================================================
" FILE: autoload/vim_typings.vim
" AUTHOR: Mike Hartington
" ORIGINAL AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! vim_typings#init()
  let stdout = systemlist('typings init')
  if len(stdout)
    " write typings.json
    echom stdout[0]
  endif
endfunction

function! vim_typings#fetch()
  echo 'fetching...'
  let stdout = systemlist('typings install')
  if len(stdout) > 1
    " fetching  xxx/yyy
    echo stdout[1]
  endif
endfunction

function! vim_typings#install(...)
  let type_file_list = map(range(1, a:{0}), 'a:{v:val}')
  let stdouts = systemlist('typings install '.join(type_file_list, ' ').' --save')
  if len(stdouts)
    echom join(stdouts, ', ')
  endif
endfunction

function! vim_typings#installAmbient(...)
  let type_file_list = map(range(1, a:{0}), 'a:{v:val}')
  let stdouts = systemlist('typings install '.join(type_file_list, ' ').' --ambient --save')
  if len(stdouts)
    echom join(stdouts, ', ')
  endif
endfunction
function! vim_typings#uninstall(...)
  let type_file_list = map(range(1, a:{0}), 'a:{v:val}')
  let stdouts = systemlist('typings uninstall '.join(type_file_list, ' ').' --save')
  if len(stdouts)
    echom join(stdouts, ', ')
  endif
endfunction

function! vim_typings#update()
  let stdouts = systemlist('typings update')
  if len(stdouts)
    echom join(stdouts, ', ')
  endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo


