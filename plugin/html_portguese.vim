" Vim html_portuguese plugin.
" Version: 1.1
" 
" Description:
" When loading a html file, this plugin replaces all
" HTML-coded Portuquese  (like &ccedil;) with the 
" normal representation (ç).
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
" v1.1 29/02/2004]
"  - fixed bug typo with acute string
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
    %s/&atilde;/ã/eIg
    %s/&acirc;/â/eIg
    %s/&aacute;/á/eIg
    %s/&agrave;/à/eIg
    %s/&Atilde;/Ã/eIg
    %s/&Acirc;/Â/eIg
    %s/&Aacute;/Á/eIg
    %s/&Agrave;/À/eIg
    " letter 'e' 'E'
    %s/&ecirc;/ê/eIg
    %s/&eacute;/é/eIg
    %s/&egrave;/è/eIg
    %s/&Ecirc;/Ê/eIg
    %s/&Eacute;/É/eIg
    %s/&Egrave;/È/eIg
    " letter 'i' 'I'
    %s/&iacute;/í/eIg
    %s/&igrave;/ì/eIg
    %s/&Iacute;/Í/eIg
    %s/&Igrave;/Ì/eIg
   " letter 'o' 'O' 
    %s/&otilde;/õ/eIg
    %s/&ocirc;/ô/eIg
    %s/&oacute;/ó/eIg
    %s/&ograve;/ò/eIg
    %s/&Otilde;/Õ/eIg
    %s/&Ocirc;/Ô/eIg
    %s/&Oacute;/Ó/eIg
    %s/&Ograve;/Ò/eIg
    " letter 'u' 'U'
    %s/&ucirc;/û/eIg
    %s/&uacute;/ú/eIg
    %s/&ugrave;/ù/eIg
    %s/&Ucirc;/Û/eIg
    %s/&Uacute;/Ú/eIg
    %s/&Ugrave;/Ù/eIg
    " latin capital letter C with cedilla,
    %s/&ccedil;/ç/eIg
    %s/&Ccedil;/Ç/eIg
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
    %s/ã/\&atilde;/eIg
    %s/â/\&acirc;/eIg
    %s/á/\&aacute;/eIg
    %s/à/\&agrave;/eIg
    %s/Ã/\&Atilde;/eIg
    %s/Â/\&Acirc;/eIg
    %s/Á/\&Aacute;/eIg
    %s/À/\&Agrave;/eIg
    " letter 'e' 'E'
    %s/ê/\&ecirc;/eIg
    %s/é/\&eacute;/eIg
    %s/è/\&egrave;/eIg
    %s/Ê/\&Ecirc;/eIg
    %s/É/\&Eacute;/eIg
    %s/È/\&Egrave;/eIg
    " letter 'i' 'I'
    %s/í/\&iacute;/eIg
    %s/ì/\&igrave;/eIg
    %s/Í/\&Iacute;/eIg
    %s/Ì/\&Igrave;/eIg
   " letter 'o' 'O' 
    %s/õ/\&otilde;/eIg
    %s/ô/\&ocirc;/eIg
    %s/ó/\&oacute;/eIg
    %s/ò/\&ograve;/eIg
    %s/Õ/\&Otilde;/eIg
    %s/Ô/\&Ocirc;/eIg
    %s/Ó/\&Oacute;/eIg
    %s/Ò/\&Ograve;/eIg
    " letter 'u' 'U'
    %s/û/\&ucirc;/eIg
    %s/ú/\&uacute;/eIg
    %s/ù/\&ugrave;/eIg
    %s/Û/\&Ucirc;/eIg
    %s/Ú/\&Uacute;/eIg
    %s/Ù/\&Ugrave;/eIg
    " latin capital letter C with cedilla,
    %s/ç/\&ccedil;/eIg
    %s/ç/\&Ccedil;/eIg
    let &report=s:save_report
    unlet s:save_report
    call cursor(s:line,s:column)
    unlet s:line
    unlet s:column
endfunction

