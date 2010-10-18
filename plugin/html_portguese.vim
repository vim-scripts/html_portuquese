" Vim html_portuguese plugin.
" Version: 1.0
" 
" Description:
" When loading a html or php file, this plugin replaces all
" HTML-coded Portuquese  (like &ccedil;) with the 
" normal representation (�).
"
" Is based on the html_umlaute by Timo Teifel <timo at teifel-net dot de>.
"
" Maintainer: Rubens Marins <rubens at windstar dot com dot br>

" Usage:
" It does everything automatically. When reading a file,
" it replaces (&ccedil;, &atilde; etc) with the corresponding 
" character encoding.
" When saving, it replaces the special Characters with the
" html-Code, undoing it after the write, to keep the chars
" if you keep working with the file.
"
" Installation:
" Save this file in vim plugin dir ( /usr/share/vim/vim61/plugin) or 
" ~/.vim/plugin/html_portuguese.vim.
"
" Licence: GPL 
" 
" Changelog:
" v1.0 28/02/2004
"  - initial release

" do this only once per buffer:
if exists("b:loaded_html_portuguese")
    finish
endif
let b:loaded_html_portuguese = 1

if has("autocmd")
augroup html_portuguese
    au!
    au FileType      html,php			call s:LeHtml()
    au BufWrite      *.html,*.htm,*.php		call s:EscreveHtml()
    au BufWritePost  *.html,*.htm,*.php		call s:LeHtml()
augroup END
endif


" functions need to be sourced only once per session
if exists("s:loaded_html_portuguese_functions")
  finish
endif
let s:loaded_html_portuguese_functions = 1

function s:LeHtml()
    " remember cursor position:
	let s:line = line(".")
	let s:column = col(".")
    " if more than 'report' substitutions have been done, vim 
    " displays it.
    let s:save_report = &report
    set report=99999
   " letter 'a' 'A'
    %s/&atilde;/�/eIg
    %s/&acirc;/�/eIg
    %s/&acute;/�/eIg
    %s/&agrave;/�/eIg
    %s/&Atilde;/�/eIg
    %s/&Acirc;/�/eIg
    %s/&Acute;/�/eIg
    %s/&Agrave;/�/eIg
    " letter 'e' 'E'
    %s/&ecirc;/�/eIg
    %s/&ecute;/�/eIg
    %s/&egrave;/�/eIg
    %s/&Ecirc;/�/eIg
    %s/&Ecute;/�/eIg
    %s/&Egrave;/�/eIg
    " letter 'i' 'I'
    %s/&icute;/�/eIg
    %s/&igrave;/�/eIg
    %s/&Icute;/�/eIg
    %s/&Igrave;/�/eIg
   " letter 'o' 'O' 
    %s/&otilde;/�/eIg
    %s/&ocirc;/�/eIg
    %s/&ocute;/�/eIg
    %s/&ograve;/�/eIg
    %s/&Otilde;/�/eIg
    %s/&Ocirc;/�/eIg
    %s/&Ocute;/�/eIg
    %s/&Ograve;/�/eIg
    " letter 'u' 'U'
    %s/&ucirc;/�/eIg
    %s/&ucute;/�/eIg
    %s/&ugrave;/�/eIg
    %s/&Ucirc;/�/eIg
    %s/&Ucute;/�/eIg
    %s/&Ugrave;/�/eIg
    " latin capital letter C with cedilla,
    %s/&ccedil;/�/eIg
    %s/&Ccedil;/�/eIg
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction

function s:EscreveHtml()
	let s:line = line(".")
	let s:column = col(".")
    let s:save_report = &report
    set report=99999
   " letter 'a' 'A'
    %s/�/\&atilde;/eIg
    %s/�/\&acirc;/eIg
    %s/�/\&acute;/eIg
    %s/�/\&agrave;/eIg
    %s/�/\&Atilde;/eIg
    %s/�/\&Acirc;/eIg
    %s/�/\&Acute;/eIg
    %s/�/\&Agrave;/eIg
    " letter 'e' 'E'
    %s/�/\&ecirc;/eIg
    %s/�/\&ecute;/eIg
    %s/�/\&egrave;/eIg
    %s/�/\&Ecirc;/eIg
    %s/�/\&Ecute;/eIg
    %s/�/\&Egrave;/eIg
    " letter 'i' 'I'
    %s/�/\&icute;/eIg
    %s/�/\&igrave;/eIg
    %s/�/\&Icute;/eIg
    %s/�/\&Igrave;/eIg
   " letter 'o' 'O' 
    %s/�/\&otilde;/eIg
    %s/�/\&ocirc;/eIg
    %s/�/\&ocute;/eIg
    %s/�/\&ograve;/eIg
    %s/�/\&Otilde;/eIg
    %s/�/\&Ocirc;/eIg
    %s/�/\&Ocute;/eIg
    %s/�/\&Ograve;/eIg
    " letter 'u' 'U'
    %s/�/\&ucirc;/eIg
    %s/�/\&ucute;/eIg
    %s/�/\&ugrave;/eIg
    %s/�/\&Ucirc;/eIg
    %s/�/\&Ucute;/eIg
    %s/�/\&Ugrave;/eIg
    " latin capital letter C with cedilla,
    %s/�/\&ccedil;/eIg
    %s/�/\&Ccedil;/eIg
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction

