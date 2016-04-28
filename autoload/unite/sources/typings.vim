"============================================================================
" FILE: autoload/unite/sources/typings.vim
" AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

let s:source = {
      \ 'name': 'typings',
      \ 'description': '.d.ts files you can installe',
      \ }

function! s:source.gather_candidates(args, context)
  let stdouts = systemlist('typings search --limit 100'.join(a:args, ' '))
  let result = []
  if len(stdouts) < 3
    return
  endif
  call remove(stdouts, 0, 1)
  for type_file_name in stdouts
    call add(result, {
          \ 'word': type_file_name,
          \ 'kind': 'command',
          \ 'source': 'typings',
          \ 'action__command': 'TypingsInstallAmbient '.type_file_name
          \ })
  endfor
  return result
endfunction

function! unite#sources#typings#define()
  return s:source
endfunction

