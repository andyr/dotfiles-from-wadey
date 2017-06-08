" vim: fdm=marker:
" Recommended for vim >= 7; no guarantee of compatibility with earlier versions
" Lucas Oman <me@lucasoman.com>
" --enable-rubyinterp --prefix=/usr --enable-ruby
" Get latest from: http://github.com/lucasoman/Conf/raw/master/.vimrc


filetype off
" load pathogen
" call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()
syntax on
filetype plugin indent on

"set t_Co=256

" misc options
" {{{ interface
" lines, cols in status line
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set title

" a - terse messages (like [+] instead of [Modified]
" t - truncate file names
" I - no intro message when starting vim fileless
" T - truncate long messages to avoid having to hit a key
set shortmess=atTI

" display the number of (characters|lines) in visual mode, also cur command
set showcmd

" current mode in status line
set showmode

" max items in popup menu
set pumheight=8

" show number column
set number
set numberwidth=3

" show fold column, fold by markers
set foldcolumn=2

" (1) Simple folding rule for python
"set foldmethod=indent
"set foldnestmax=2

" (2) Syntax folding rules
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let python_syntax_folding=1
let ruby_syntax_folding=1

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>\ 

" always show tab line
set showtabline=2

" highlight search matches
set hlsearch

" highlight position of cursor
"set cursorline
"set cursorcolumn

"set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set laststatus=2
" }}}
" {{{ behavior
set nocompatible
syntax on
filetype on
filetype plugin on

" fast terminal for smoother redrawing
set ttyfast

set omnifunc=syntaxcomplete#Complete

" indentation options
" Note: smartindent is seriously outdated. cindent, even, is unnecessary.
" Let the filetype plugins do the work.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"filetype indent on
set autoindent
set cindent

set encoding=utf-8

" show matching enclosing chars for .1 sec
set showmatch
set matchtime=1

" t: autowrap text using textwidth
" l: long lines are not broken in insert mode
" c: autowrap comments using textwidth, inserting leader
" r: insert comment leader after <CR>
" o: insert comment leader after o or O
set formatoptions-=t
set formatoptions+=lcro
set textwidth=80

" context while scrolling
set scrolloff=3

" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

" backspace over anything
set backspace=indent,eol,start

" case insensitive search if all lowercase
set ignorecase smartcase

" turn off bells, change to screen flash
set visualbell

" show our whitespace
set listchars=tab:\|\ ,trail:.
"set list

" complete to longest match, then list possibilities
set wildmode=longest,list

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" keep a lot of history
set history=100

" keep lots of stuff
set viminfo+=:100
set viminfo+=/100

" don't duplicate an existing open buffer
set switchbuf=useopen

" }}}
" {{{ colors
highlight SpecialKey cterm=bold ctermfg=0
" tabe line colors
highlight TabLineFill ctermfg=DarkGray
highlight TabLine ctermfg=4 ctermbg=DarkGray cterm=bold
highlight TabLineSel ctermfg=7 cterm=none ctermbg=DarkGray

" number column colors
highlight LineNr cterm=none ctermbg=none ctermfg=4

" fold colors
highlight Folded cterm=none ctermbg=none ctermfg=4
highlight FoldColumn cterm=none ctermbg=none ctermfg=4

" visual mode colors
highlight Visual ctermbg=7 ctermfg=4

" dictionary menu colors
highlight Pmenu ctermbg=7 ctermfg=0
highlight PmenuSel ctermbg=Yellow ctermfg=0

" diff colors
highlight DiffAdd cterm=none ctermbg=4
highlight DiffDelete cterm=none ctermbg=4
highlight DiffChange cterm=none ctermbg=4
highlight DiffText cterm=none ctermbg=4

" keep cursor column last so it overrides all others
highlight CursorColumn cterm=none ctermbg=Black
highlight CursorLine cterm=none ctermbg=Black

highlight Search cterm=none ctermbg=7 ctermfg=4

" K comments the current line (#)
" Ctrl + K uncomments the current line (#).
" http://stackoverflow.com/questions/460496/whats-the-most-elegant-way-of-commenting-uncommenting-blocks-of-ruby-code-in
" noremap   <buffer> K      :s,^\(\s*\)[^# \t]\@=,\1#,e<CR>:nohls<CR>zvj
" noremap   <buffer> <C-K>  :s,^\(\s*\)#\s\@!,\1,e<CR>:nohls<CR>zvj

" make sure bold is disabled or your terminal will look like the vegas strip
set background=dark
" }}}
" {{{ filetype dependent
autocmd BufNewFile,BufRead *.html setlocal commentstring=<!--%s-->
" ruby commenstring
autocmd FileType ruby setlocal commentstring=#%s
" make help navigation easier
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
"}}}
"php syntax options {{{
let php_sql_query = 1  "for SQL syntax highlighting inside strings
let php_htmlInStrings = 1  "for HTML syntax highlighting inside strings
"php_baselib = 1  "for highlighting baselib functions
"php_asp_tags = 1  "for highlighting ASP-style short tags
"php_parent_error_close = 1  "for highlighting parent error ] or )
"php_parent_error_open = 1  "for skipping an php end tag, if there exists an open ( or [ without a closing one
"php_oldStyle = 1  "for using old colorstyle
"php_noShortTags = 1  "don't sync <? ?> as php
let php_folding = 1  "for folding classes and functions
" }}}
"netrw options {{{
let g:netrw_sort_sequence = '[\/]$,\.php,\.phtml,*,\.info$,\.swp$,\.bak$,\~$'
"}}}
"{{{taglist options
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant;p:property'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 60
" close tlist when a selection is made
let Tlist_Close_On_Select = 1
" show the prototype
let Tlist_Display_Prototype = 1
" show tags only for current buffer
let Tlist_Show_One_File = 1
"}}}
"{{{html options
let html_use_css = 1
"}}}
au BufNewFile,BufRead *.less set filetype=less
" mappings
" {{{ general
let mapleader = "\\"
" easier move screen up/down
nmap <C-j> <C-e>
nmap <C-k> <C-y>
nmap <space> za
" turns off highlighting
nmap <Leader>/ :nohl<CR>
" search for highlighted text
vmap // y/<C-R>"<CR>
" keep block highlighted when indenting
vmap >> >gv
vmap << <gv
" fix a block of XML; inserts newlines, indents properly, folds by indent
nmap <Leader>fx :setlocal filetype=xml<CR>:%s/></>\r</g<CR>:1,$!xmllint --format -<CR>:setlocal foldmethod=indent<CR>
" comment/uncomment highlighted block
vmap <Leader>cc :s!^!//!<CR>
vmap <Leader>cu :s!^//!!<CR>
" open local projects list file
nmap <Leader>l :70vsplit ~/Dropbox/projects.list<CR>
" fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>
" toggle the tag list
nmap <Leader>tl :TlistToggle<CR>
" toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" make arrow keys useful
" use them to swap between split windows
nmap <left> <C-W>h
nmap <right> <C-W>l
nmap <up> <C-W>k
nmap <down> <C-W>j
"}}}
" php {{{
" syntax check
nmap <Leader>ps :!php -l %<CR>
" run current script
nmap <Leader>pr :!php % \| less -F<CR>
" lookup keyword in function reference
nmap <Leader>ph :!pman <cword><CR>
" create test method
nmap <Leader>pt o<CR>/**<CR>@test<CR>/<CR>public function<TAB>
" phpdoc comments
nmap <Leader>cc o/**<CR>$Rev$<CR>$Date$<CR>$Id$<CR>$Author$<CR>$HeadURL$<CR><CR><CR><CR>@package <CR><BS>/<ESC>kkk$a 
nmap <Leader>cb o/**<CR><CR><CR>@param <CR>@return <CR>@example <CR><BS>/<ESC>kkkkk$a 
nmap <Leader>cv o/**<CR><CR><CR>@var <CR><BS>/<ESC>kkk$a 
nmap <Leader>cp o/**<CR><CR><CR>@author Lucas Oman <me@lucasoman.com><CR>@param <CR>@return <CR>@example <CR><BS>/<ESC>kkkkkk$a 
"}}}
" svn {{{
" set svn keywords
nmap <Leader>sk :!svn propset svn:keywords "Rev Date Id Author HeadURL" %<CR>
nmap <Leader>sp :call SvnPushFile()<CR>
com! -nargs=1 Sstat :call SvnStatus("<args>")

" view status of given path
fun! SvnStatus(path)
	tabe
	setl buftype=nofile
	exe "r !svn st ".a:path
endfunction

" call script to copy file to appropriate location in htdocs
fun! SvnPushFile()
	let line = getline('.')
	let file = strpart(l:line,8)
	exe "!~/lib/updatedev.php ".l:file
endfunction
"}}}
"f keys {{{
nmap <F2> :call ToggleColumns()<CR>
imap <F2> <C-o>:call ToggleColumns()<CR>
nmap <F3> :Nload<CR>
" <F4>
set pastetoggle=<F5>
" <F6>
nmap <F7> :!updatedev.php %:p<CR>
nmap <F8> :call WriteTrace()<CR>
nmap <F9> \ph
" <F10>
" <F11> don't use; terminal full-screen
" <F12>
" }}}

" Single Nerdtree instance on every tab
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>

"{{{ list file
let g:listFile_ranks = ['=','1','2','3','4','5','!','o','-','?','x']
autocmd BufNewFile,BufRead *.list call MyListFileStuff()
fun! MyListFileStuff()
	nmap <buffer> ,! :Lmark !<CR>
	vmap <buffer> ,! :Lmark !<CR>
	nmap <buffer> ,tq :Ltag quick<CR>
	vmap <buffer> ,tq :Ltag quick<CR>
	nmap <buffer> ,sq :Lsearch tag quick<CR>
	nmap <buffer> ,d ,x,t,r
endfunction
"}}}

" minor helpful stuff
fun! ToggleColumns() "{{{
	"make it easy to remove line number column etc. for cross-terminal copy/paste
  if &number
    set nonumber
    set foldcolumn=0
    let s:showbreaktmp = &showbreak
    set showbreak=
  else
    set number
    set foldcolumn=2
    let &showbreak = s:showbreaktmp
  end
endfunction
"}}}
fun! WriteTrace() "{{{
	let lineNum = line('.')
	let lineFile = bufname('%')
	let lineVal = getline(lineNum)

	let allLines = readfile($HOME."/trace.txt")
	let allLines = add(allLines,lineFile.":".lineNum)
	let allLines = add(allLines,lineVal)
	let allLines = add(allLines,"")

	call writefile(allLines,$HOME."/trace.txt")
endfunction
"}}}
"{{{ctags stuff
nmap <Leader>tf :call CtagsFind(expand('<cword>'))<CR>
com! -nargs=+ Tf :call CtagsFind("<args>")
" split window and search for tag
nmap <Leader>ts :exe('stj '.expand('<cword>'))<CR>

" open new tab and search for tag
fun! CtagsFind(keyword)
	tabe
	exe "tj ".a:keyword
endfunction
"}}}

" stand-alone components
"{{{ TAB-COMPLETE and SNIPPETS
" add new snippets as regex=>completion
" first match encountered is used
let s:snippets = {}
let s:snippets['^\s*if$'] = " () {\<CR>}\<ESC>k^f)i" 
let s:snippets['function$'] = " () {\<CR>}\<ESC>k^f(i" 
let s:snippets['^\s*class$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*interface$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*foreach$'] = " () {\<CR>}\<ESC>k^f)i" 
let s:snippets['^\s*while$'] = " () {\<CR>}\<ESC>k^f)i" 

" when tab is pressed:
" 1) checks snippets for matches, return match if there is one
" 2) if character behind cursor is whitespace, just return a tab
" 3) if word behind cursor contains a slash, try filename complete
" 4) otherwise, try to ctrl-p complete
" fun! CleverTab()
" 	if pumvisible()
" 		return "\<C-N>"
" 	endif
" 	if col('.') > 1
" 		let beginning = strpart( getline('.'), 0, col('.')-1 )
" 		let words = split(l:beginning,' ')
" 		let thisWord = l:words[-1]
" 
" 		for key in keys(s:snippets)
" 			if l:beginning =~ key
" 				return s:snippets[key]
" 			endif
" 		endfor
" 	else
" 		let beginning = ''
" 	endif
" 
" 	if l:beginning == '' || l:beginning =~ '\s$'
" 		return "\<Tab>"
" 	elseif (l:thisWord =~ '/')
" 		return "\<C-X>\<C-F>"
" 	else
" 		return "\<C-X>\<C-O>"
" 		"return "\<C-P>"
" 	endif
" endfunction
" imap <Tab> <C-R>=CleverTab()<CR>

"}}}
"CODE GREP {{{
" grep for given string (second is case insensitive)
" simply a wrapper for vimgrep
" eg: :F /badxmlexception/ lib php
com! -nargs=+ F :call CommandFind("<args>")
fun! CommandFind(args)
	tabe
	let parts = split(a:args,' ')
	exe "vimgrep ".l:parts[0]." ".l:parts[1]."/**/*.".l:parts[2]
	exe "copen"
endfunction
"}}}
"{{{ TAB MGMT
" Some useful bits for managing tabs.
" Also changes format of tab line.
" Commands and shortcuts:
" \oc - open dir of current file in new tab
" H - navigate to tab to the left
" L - navigate to tab to the right
" C-l - move current tab left
" C-h - move current tab right
" gf - changes default behavior from opening file under cursor in current window to opening in new tab
nmap <Leader>oc :tabe %:h<CR>

" quicker aliases for navigating tabs
nmap H gT
nmap L gt
" move tab left or right
nmap <C-l> :call MoveTab(0)<CR>
nmap <C-h> :call MoveTab(-2)<CR>

" gf should use new tab, not current buffer
map gf :tabe <cfile><CR>

"tab line
fun! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'.(i+1).''
		" the filename is made by MyTabLabel()
		let s .= '%{MyTabLabel(' . (i + 1) . ')}  '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	return s
endfunction

fun! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let fullname = bufname(buflist[winnr - 1])
	" show a/b/c/filename.ext
	"let fullname = substitute(fullname,"(\w){1}\w*/","\1/","g")
	" show filename.ext
	let fullname = substitute(fullname,".*/","","")
	if getbufvar(buflist[winnr - 1],"&mod")
		let modified = "+"
	else
		let modified = " "
	endif
	return modified.fullname
endfunction

" Use the above tabe naming scheme
set tabline=%!MyTabLine()

"tab moving
fun! MoveTab(n)
	let which = tabpagenr()
	let which = which + a:n
	exe "tabm ".which
endfunction
"}}}

" === test some of this by hand ===
"let mapleader = ","

source ~/.vim/vundle.vim

syntax enable               "syntax highlighting

"set bg=dark                 "for dark background consoles

"set tabstop=4               "tab = 4 spaces
"set softtabstop=4           "tab = 4 spaces
"set shiftwidth=4            "tab = 4 spaces
"set expandtab               "turn tabs in spaces

"set number
"if exists("&relativenumber")
"    set norelativenumber
"endif

"nnoremap / /\v
"vnoremap / /\v
"nnoremap Y y$
"nnoremap Q gq
set ignorecase              "ignore case in searches
set smartcase
set gdefault
set hlsearch                "highlight search items"

"set modeline                "read modeline from files"
"set modelines=5             "look for modelines in first 5 lines"

"set copyindent              "copy the previous indentation on autoindenting
"set hidden                  "hide buffers instead of closing them

"" wrapping stuff
"set wrap
"set textwidth=0             "When wrapping is off, break lines at 78 chars
"set formatoptions=qrn1

color jellybeans

"if exists("&colorcolumn")
"    set colorcolumn=80
"    hi ColorColumn ctermbg=black guibg=grey10
"    "match ErrorMsg '\%>80v.\+'
"endif

"set wildmode=list:longest
"set wildignore+=*.o,*.obj,*.pyc,*.class,.git,node_modules,lib-cov

" use unicode in listchars
" https://github.com/tpope/vim-sensible/pull/58/files
"if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
"    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
"endif

"" TOhtml stuff
"let html_use_css=1          "use css in HTML output
"let use_xhtml=1             "use xhtml in HTML output

"" Folding
"set foldmethod=indent       "fold based on identation 
"set nofen                   "open all folds initially

"set printoptions=paper:letter,number:y

"" some system specific commmands
"if has("mac")
"    iab  rtime   <ESC>:r!gdate -R<CR>i<BS><ESC>A
"elseif has("unix")
"    iab  rtime   <ESC>:r!date -R<CR>i<BS><ESC>A
"endif

"" toggle margins
"map ;L ;on-m
"map ;off-m      :set textwidth=0\|map ;L ;on-m<CR>
"map ;on-m       :set textwidth=78\|map ;L ;off-m<CR>

" Change <tab>s to spaces
"map ;T :retab<CR>

"nnoremap j gj
"nnoremap k gk

" Visually select the text that was last edited/pasted
"nmap gV `[v`]

"" F key toggles
"map <F7>    :set relativenumber!<CR>
"map <F8>    :set paste!<CR>
"map <F9>    :set wrap!<CR>

"map <F10>   :Tlist<CR>
"map <F11>   :wa!<CR>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>
"map <F12>   :wa!<CR>:make<CR>

"let g:SuperTabDefaultCompletionType = "context"

"set verbose=0

"set list
"nmap <silent> <leader>s :set nolist!<CR>
"nmap <silent> <leader>n :silent :nohlsearch<CR>
"nmap . .`[

" GIT
" set laststatus=2
" set statusline=%<%f[%{GitBranch()}]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %3*%{strlen(&ft)?&ft:'none'}%*\ %4*%{fugitive#statusline()}%*%h%m%r%=%-14.(%l,%c%V%)\ %P

" From https://gist.github.com/840731
"set statusline=\ "
"set statusline+=%-25.80f\ " file name minimum 25, maxiumum 80 (right justified)
"set statusline+=%h "help file flag
"set statusline+=%r "read only flag
"set statusline+=%m "modified flag
"set statusline+=%w "preview flag
"set statusline+=\ "
"set statusline+=[
"set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
"set statusline+=]\ "
"set statusline+=%1*%{fugitive#statusline()}%*\ " Fugitive
"set statusline+=%5*%{Rvm#statusline()}%*\ " RVM
"set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " Syntastic Syntax Checking
"set statusline+=%= " right align
"set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" Don't count warnings as errors
" let g:syntastic_quiet_warnings=1
"let g:syntastic_stl_format = '%E{[Err: %fe #%e]}'
"let g:syntastic_go_checkers = ['go', 'govet']

"au BufRead,BufNewFile *.thrift set filetype=thrift
"au BufRead,BufNewFile *.json set filetype=json

"if has("autocmd")
"    autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap

"    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
"    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
"    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
"    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
"    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist

    " http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"    autocmd BufReadPost fugitive://* set bufhidden=delete
"    autocmd User fugitive
"      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"      \   nnoremap <buffer> .. :edit %:h<CR> |
"      \ endif
"endif
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" Removes trailing spaces
"command! TrimWhiteSpace %s/\v\s+$//

" SaveasSamePath saves with new name to same path (all one line)
" via http://vim.1045645.n5.nabble.com/How-to-make-saveas-default-to-original-file-s-directory-td2827361.html
"command! -nargs=1 SaveasSamePath exe "saveas " . expand("%:p:h") . "/" . expand("<args>")

"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  "runtime! bundle/guicolorscheme.vim/plugin/guicolorscheme.vim
  "GuiColorScheme twilight
"endif

" ConqueTerm settings
"let g:ConqueTerm_ReadUnfocused = 1
"let g:ConqueTerm_InsertOnEnter = 1
"let g:ConqueTerm_CWInsert = 1

" Makes it easy to run a shells
" example: can do ":Node %" to run the current file
"command! -nargs=* -complete=file Shell ConqueTermSplit <args>
"command! -nargs=* -complete=file Zsh ConqueTermSplit zsh <args>
"command! -nargs=* -complete=file Node ConqueTermSplit node <args>
"command! -nargs=* -complete=file Python ConqueTermSplit python <args>

" use python json to Tidy a file
"command! -range=% -nargs=* Json <line1>,<line2>!python -mjson.tool <args>

" Support xterm mouse
set mouse=a

" A motion for the current match.
" Lets you do "ci/" to change the current match
" via http://stackoverflow.com/a/8697727/544243
"vnoremap <silent> i/ :<c-u>call SelectMatch()<cr>
"onoremap <silent> i/ :call SelectMatch()<cr>
"function! SelectMatch()
"    if search(@/, 'bcW')
"        norm! v
"        call search(@/, 'ceW')
"    else
"        norm! gv
"    endif
"endfunction

" For vim-gitgutters
"highlight clear SignColumn

"if has("unix")
"  set directory=~/.vim/swap
"  set backupdir=~/.vim/backup
"  set undodir=~/.vim/undo
"  set undofile
"endif

" For vim-airline
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_section_c='%{fnamemodify(getcwd(), ":t")} %f%m'
" let g:airline#extensions#tabline#enabled = 1

"let g:go_fmt_command = "goimports"

" vim-go
" au FileType go nmap gd <Plug>(go-def)

" ultisnips
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"

"function! DeleteInactiveBufs()
"    "From tabpagebuflist() help, get a list of all buffers in all tabs
"    let tablist = []
"    for i in range(tabpagenr('$'))
"        call extend(tablist, tabpagebuflist(i + 1))
"    endfor
"
"    "Below originally inspired by Hara Krishna Dara and Keith Roberts
"    "http://tech.groups.yahoo.com/group/vim/message/56425
"    let nWipeouts = 0
"    for i in range(1, bufnr('$'))
"        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
"        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
"            silent exec 'bwipeout' i
"            let nWipeouts = nWipeouts + 1
"        endif
"    endfor
"    echomsg nWipeouts . ' buffer(s) wiped out'
"endfunction
"command! Bdi :call DeleteInactiveBufs()
