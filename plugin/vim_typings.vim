"============================================================================
" FILE: plugin/vim_dtsm.vim
" AUTHOR: Quramy <yosuke.kurami@gmail.com>
"============================================================================

scriptencoding utf-8

" Preprocessing {{{
if exists('g:loaded_vim_dtsm')
  finish
endif

let g:loaded_vim_dtsm = 1

let s:save_cpo = &cpo
set cpo&vim
" Preprocessing }}}

command!              TypingsInit             :call vim_typings#init()
command!              TypingsFetch            :call vim_typings#fetch()
command! -nargs=+     TypingsInstall          :call vim_typings#install(<f-args>)
command! -nargs=+     TypingsInstallAmbient   :call vim_typings#installAmbient(<f-args>)
command! -nargs=+     TypingsUninstall        :call vim_typings#uninstall(<f-args>)
command!              TypingsUpdate           :call vim_typings#update()

let &cpo = s:save_cpo
unlet s:save_cpo
