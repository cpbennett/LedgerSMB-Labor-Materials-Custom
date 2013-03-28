let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <silent> <C-F5> :call Cream_case_reverse("i")
imap <silent> <M-F5> :call Cream_case_lower("i")
imap <silent> <S-F5> :call Cream_case_upper("i")
imap <silent> <F5> :call Cream_case_title("i")
nmap   :call ToggleFold()
vmap   zf
map <silent> \cc <Plug>CRV_CRefVimInvoke
map <silent> \cw <Plug>CRV_CRefVimAsk
nmap <silent> \cr <Plug>CRV_CRefVimNormal
vmap <silent> \cr <Plug>CRV_CRefVimVisual
vnoremap <silent> _t :!perltidy -q
nnoremap <silent> _t :%!perltidy -q
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
vmap <silent> <C-F5> :call Cream_case_reverse("v")
vmap <silent> <M-F5> :call Cream_case_lower("v")
vmap <silent> <S-F5> :call Cream_case_upper("v")
vmap <silent> <F5> :call Cream_case_title("v")
map <F12> :set nu! 
map <F11> :setlocal nospell
map <F10> :tabnew
map <F9> :set spl=es spell
map <F8> :set spl=en_us spell
map <F7> :cal SetSyn("perl")
map <F6> :cal SetSyn("xhtml")
abbr !S ##        Sub
abbr !l #######################################################################
abbr !# #!/usr/bin/perl
abbr !m my 
abbr !u undef my
abbr !v our $VERSION =
abbr !s use strict;
abbr !w use warnings;
abbr #m main() {
abbr #l /*----------------------------------------------*/
abbr #i #include
abbr #d #define
abbr #e ************************************************/
abbr #b /************************************************
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set cinoptions=:0,t0,+4,(4
set fileencodings=ucs-bom,utf-8,default,latin1
set hlsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set mouse=a
set printexpr=system('/usr/local/bin/lpr'\ .\ (&printdevice\ ==\ ''\ ?\ ''\ :\ '\ -P'\ .\ &printdevice)\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error
set ruler
set termencoding=utf-8
set window=59
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/Labor.cfg
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/LaborViewerDuplicator.cfg
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/Products.cfg
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/ProductsViewerDuplicator.cfg
badd +1 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/manual.cfg
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/gl.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/pg.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/ph.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/lab.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/tr.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/manual.pl
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/photos.cfg
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/BWCLFields.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/DeleteRecord_B.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/InsertRecord_B.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/RecordUpdates_B.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ShowAdmin.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewRecords_B.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/SelectFAL.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/SelectLPL.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewFALRecords.pm
badd +0 /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewLPLRecords.pm
silent! argdel *
edit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/Labor.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%*[^\"]\"%f\"%*\\D%l:%c:\ %m,%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:%c:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ %trror:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ %trror:\ for\ each\ function\ it\ appears\ in.),%f:%l:%c:\ %terror:\ %m,%f:%l:%c:\ %tarning:\ %m,%f:%l:%c:\ %m,%f:%l:\ %terror:\ %m,%f:%l:\ %tarning:\ %m,%f:%l:\ %m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=tidy\ -quiet\ -errors\ %
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/LaborViewerDuplicator.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/Products.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/ProductsViewerDuplicator.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/photos.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/manual.cfg
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cfg'
setlocal filetype=cfg
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cfg'
setlocal syntax=cfg
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/gl.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/pg.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/ph.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/lab.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/tr.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/manual.pl
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/BWCLFields.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/DeleteRecord_B.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/InsertRecord_B.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/RecordUpdates_B.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ShowAdmin.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewRecords_B.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/SelectFAL.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/SelectLPL.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewFALRecords.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit /var/www/var/www/htdocs/users/forums.ledgersmb.org/perl/VP/BWCL/ViewLPLRecords.pm
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
imap <buffer> <silent> <S-F1> :call Perl_perldoc()
imap <buffer> <silent> <S-F9> :call Perl_Arguments()
imap <buffer> <silent> <C-F9> :call Perl_Run()
imap <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
nmap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
map <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
map <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
map <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
map <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call Perl_XtermSize()
map <buffer> <silent> \rk :call Perl_Settings()
vmap <buffer> <silent> \rh :call Perl_Hardcopy("v")
nmap <buffer> <silent> \rh :call Perl_Hardcopy("n")
omap <buffer> <silent> \rh :call Perl_Hardcopy("n")
map <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
map <buffer> <silent> \rpc :call Perl_Perlcritic()
vmap <buffer> <silent> \ry :call Perl_Perltidy("v")
nmap <buffer> <silent> \ry :call Perl_Perltidy("n")
omap <buffer> <silent> \ry :call Perl_Perltidy("n")
map <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
map <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> <silent> \rma :call Perl_MakeArguments()
noremap <buffer> <silent> \rm :call Perl_Make()
noremap <buffer> <silent> \rw :call Perl_PerlSwitches()
noremap <buffer> <silent> \ra :call Perl_Arguments()
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "string", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "regexp", "n" )j
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("wv")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
vnoremap <buffer> <silent> \cl :call Perl_MultiLineEndComments()A
nnoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()A
map <buffer> <silent> \hp :call Perl_HelpPerlsupport()
map <buffer> <silent> \h :call Perl_perldoc()
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
onoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
onoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
onoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
onoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
onoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
onoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
onoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
onoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
onoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
onoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
onoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
onoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
onoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
onoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
onoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
onoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
onoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
onoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
onoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
onoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
onoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
onoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
onoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
onoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
onoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
onoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
onoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
onoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
onoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
onoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
onoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
onoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
onoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
onoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
onoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
onoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
onoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
onoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
onoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
onoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
onoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
onoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
onoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
onoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
onoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
onoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
onoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
onoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
onoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
onoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
onoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
onoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
onoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
map <buffer> <silent> <S-F1> :call Perl_perldoc()
map <buffer> <silent> <S-F9> :call Perl_Arguments()
map <buffer> <silent> <C-F9> :call Perl_Run()
map <buffer> <silent> <M-F9> :call Perl_SyntaxCheck()
imap <buffer> <silent> <NL> =Perl_JumpCtrlJ()
imap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call Perl_XtermSize()
imap <buffer> <silent> \rk :call Perl_Settings()
imap <buffer> <silent> \rh :call Perl_Hardcopy("n")
imap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
imap <buffer> <silent> \rpc :call Perl_Perlcritic()
imap <buffer> <silent> \ry :call Perl_Perltidy("n")
imap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
imap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> <silent> \rma :call Perl_MakeArguments()
inoremap <buffer> <silent> \rm :call Perl_Make()
inoremap <buffer> <silent> \rw :call Perl_PerlSwitches()
inoremap <buffer> <silent> \ra :call Perl_Arguments()
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,-1)
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
imap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
imap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
inoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
inoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
inoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
inoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
inoremap <buffer> <silent> \vs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
inoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
inoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
inoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
inoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.files")
inoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
inoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
inoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
inoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
inoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
inoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
inoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
inoremap <buffer> <silent> \ihh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
inoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
inoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
inoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
inoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
inoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
inoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
inoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
inoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
inoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
inoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
inoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
inoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
inoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
inoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
inoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
inoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
inoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
inoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,t0,+4,(4
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
set foldcolumn=7
setlocal foldcolumn=7
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcrq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=/usr/local/libdata/perl5/site_perl/i386-openbsd,/usr/libdata/perl5/site_perl/i386-openbsd,/usr/local/libdata/perl5/site_perl,/usr/libdata/perl5/site_perl,/usr/libdata/perl5/i386-openbsd/5.12.2,/usr/local/libdata/perl5/i386-openbsd/5.12.2,/usr/libdata/perl5,/usr/local/libdata/perl5,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 7
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
