" vim: foldmethod=marker
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" This config is made for writing (MD - Lint, Formatting), LaTeX (Lint), coding (Python [Lint, Formatting], HTML [Emmet], CSS, SCSS, LESS [Lint, Formatting], Bash)
"
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" VimPlug " {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Writing
Plug 'dhruvasagar/vim-table-mode' " Markdown Tables (:TableModeToggle and start typing)
Plug 'rhysd/vim-grammarous' " :GrammarousCheck --lang={lang}
Plug 'moorereason/vim-markdownfmt' " :call markdownfmt#Format()
Plug 'junegunn/goyo.vim' " Zen Mode (:Goyo)
Plug 'junegunn/limelight.vim' " See only current paragrapgh (:Limelight)(Best with Goyo)
Plug 'vimwiki/vimwiki' " Note-manager
Plug 'ducbueno/vimwiki-roam' " Add Roam funcionality
" Files
Plug 'junegunn/fzf.vim' " Fzf inside vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Install fzf
" LaTeX
Plug 'lervag/vimtex' " <Space> + ll => live preview
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion
" Linting
Plug 'vim-syntastic/syntastic'
" Productivity
Plug 'dbeniamine/todo.txt-vim'
Plug 'tpope/vim-surround' " Surround X with a character
Plug 'scrooloose/nerdcommenter' " <Leader>c + <space> toggle comment
Plug 'svermeulen/vim-cutlass' " Cut by pressing X, instead of d
Plug 'Townk/vim-autoclose' " Matching brackets
Plug 'nathanaelkane/vim-indent-guides'
"" Snippets
Plug 'SirVer/ultisnips' " Snippet engine (triggered from coc by <tab>)
Plug 'honza/vim-snippets' " Snippets from Honza
Plug 'mattn/emmet-vim' " HTML Snippets Press , , (comma + comma)
"" Visuals
Plug 'sheerun/vim-polyglot' " Syntax highlighting
Plug 'ap/vim-css-color' " See color previews
Plug 'junegunn/rainbow_parentheses.vim' " Rainbow paratheses
"" Git
Plug 'airblade/vim-gitgutter' " Manage git directly from vim
Plug 'tpope/vim-fugitive' " Git commands in Vim
" Rice
Plug 'ryanoasis/vim-devicons' " Nice icons
Plug 'vim-airline/vim-airline' " Status Line
Plug 'vim-airline/vim-airline-themes' " Status Line Themes
" Themes "
Plug 'cocopon/iceberg.vim' 
Plug 'arzg/vim-colors-xcode' 
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" Initialize plugin system " {{{
call plug#end()
if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
" }}}
"}}}
" General " {{{
let mapleader=","
let maplocalleader=" "
set cursorline "Highlights current line
set modeline "vim settings at the beginning of a file
syntax on  "Enables syntax highlighting (also from packages)
set wildmenu "Visual menu when cycling through auto-complete with TAB
set wildmode=longest:full "TAB shows possible completions but does not initially change the entire word
set showmatch "Highlights matching ([{}])
set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " search is case-insensitive, unless there is at least one CAPITAL letter
set smartcase " search is case-insensitive, unless there is at least one CAPITAL letter
set clipboard=unnamedplus " use system clipboard
set mouse=a " enable mouse everywhere
set encoding=UTF-8 " encoding used internaly
set guifont=Consolas:h18 " font for gnvim
set termguicolors " Ignore terminal colorscheme
set list " show whitespace chars defined in listchars
set listchars=tab:>·,trail:~,extends:>,precedes:< " eol:¬, = disables cursor in gnvim
set updatetime=100 " write to disk after X miliseconds to save state for crashes

" Tabs " {{{
" http://vimcasts.org/episodes/tabs-and-spaces/ "
set expandtab " tab to a multiple of tabstop and enables uses of spaces
set tabstop=2 " width of TAB character => when we insert new tabs, they become spaces, which is dictated by expandtab (if there are already any tabs, in the file, this is their displayed width)
set softtabstop=2 " when using Tab/Backspace add/delete whole tabs not a single space
set shiftwidth=2 " determines how much a line is moved when using >>,<<,== (should be the same as tabstop)
set hidden " ability to jump to new buffer without saving
"}}}
autocmd BufWritePost *sxhkdrc !pkill -SIGUSR1 sxhkd
" Update binds when sxhkdrc is updated.
autocmd BufWritePost *.py Format " Auto-format python files
" Lin" numbers{{{
set number relativenumber
set nu rnu
"}}}
"}}}
" Theme{{{
"colorscheme onehalfdark
"colorscheme xcodedarkhc
"colorscheme iceberg
colorscheme dracula
let g:airline_theme='deus'
"let g:airline_theme='dracula'"}}}
" Ruler " {{{
set ruler " display position in a file
set autoread " automatically update file with changes made outside of vim
set smartindent
set autoindent
set laststatus=2 "status line always
set backspace=indent,eol,start
"}}}
" Functions{{{
" Writing{{{
func! Writing()
  setlocal wrap
  setlocal linebreak
endfu
com! Writing call Writing()
autocmd FileType markdown Writing
"}}}
" Other {{{
"map <C-q> :!code %<CR>
func! Code()
  !code %
endfu
com! Code call Code()
" }}}
"}}}
" Mappings{{{
nnoremap <Leader>r :source $MYVIMRC<CR>
" Go through tabs
map gt :bn<cr>
map gT :bp<cr>
" Fzf
map <C-n> :Files!<CR>
map <C-p> :Rg!<CR>
map <C-h> :Files! ~/<CR>
" Open with xdg
nnoremap <leader>o :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>
" New splits " {{{
set splitbelow splitright " new split appears below and right
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
"}}}
"}}}
" Plug-Conf "{{{
let g:tex_flavor = 'latex'
let g:user_emmet_leader_key=','
let g:latex_pdf_viewer="zathura"
" Activation of rainbow paratheses based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType python,html RainbowParentheses
augroup END
" Indent Guides {{{ "
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#30303a   ctermbg=13
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#30303a ctermbg=4
"}}}
" Todo.txt "{{{
" Use todo#complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete
" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>
" }}}
" Markdown{{{
let g:vim_markdown_conceal = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:markdownfmt_autosave=0 " Does not work with joplin
"}}}
" FZF "{{{
let g:fzf_preview_window = 'right:50%'
let g:fzf_buffers_jump = 1
noremap <c-l> :Snippets<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)
" }}}
" VimWiki "{{{
let g:vimwiki_folding = 'custom' " Load from ftplugin
let g:vimwiki_auto_header = 1 " create heading in new file
let g:vimwiki_global_ext = 0 " (don't) create temp wikis
"let g:vimwiki_ext2syntax = {}
" Maxhi gives different colors to links that lead nowhere
"let g:vimwiki_list = [{'path': '~/Mega/Documents/Other/vimwiki/',
                       "\'path_html': '~/Mega/Documents/Other/vimwiki_html',
                       "\'syntax': 'default', 'ext': '.wiki', 'maxhi': 1,
                       "\'auto_export': 1, 'auto_diary_index': 1, 'auto_tags': 1}]

  let wiki_1 = {}
  let wiki_1.path = '~/Mega/Documents/Other/vimwiki/'
  let wiki_1.path_html = '~/Mega/Documents/Other/vimwiki_html/'
  let wiki_1.syntax = 'default'
  let wiki_1.ext = ".wiki"
  let wiki_1.maxhi = 1 " highlight links leading to empty pages
  let wiki_1.auto_export = 1
  let wiki_1.auto_diary_index = 1
  let wiki_1.auto_tags = 1

  let wiki_2 = {}
  let wiki_2.path = '~/Mega/Documents/Other/quicknotes/'
  let wiki_2.path_html = '~/Mega/Documents/Other/quicknotes_html/'
  let wiki_2.syntax = 'default'
  let wiki_2.ext = ".wiki"
  let wiki_2.maxhi = 1 " highlight links leading to empty pages
  let wiki_2.auto_export = 1
  let wiki_2.auto_diary_index = 1
  let wiki_2.auto_tags = 1

  let g:vimwiki_list = [wiki_1, wiki_2]
" Colors for Headings and Links
hi VimwikiHeader1 guifg=#FFB86C cterm=bold gui=bold
hi VimwikiHeader2 guifg=#BD93F9 cterm=bold gui=bold
hi VimwikiHeader3 guifg=#F1FA8C cterm=bold gui=bold
hi VimwikiHeader4 guifg=#50FA7B cterm=bold gui=bold
hi VimwikiHeader5 guifg=#00FFFF cterm=bold gui=bold
hi VimwikiHeader6 guifg=#FFFF00 cterm=bold gui=bold
hi VimwikiLink cterm=underline ctermfg=cyan guifg=cyan gui=underline
" Diary simplification
command! Diary VimwikiDiaryIndex
"}}}
" Goyo "{{{
let g:goyo_width = 90
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"}}}
" Emmet "{{{
" To use emmet press <C-,> ,
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"}}}
" Clipboard Magic "{{{
" Use X<motion> to cut
" Use XX to cut line
nnoremap X d
xnoremap X d
nnoremap XX dd
"}}}
" Airline "{{{
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"}}}
" ALE "{{{
"let g:ale_sign_error = 'X'
"let g:ale_sign_warning = '!'
"let g:ale_fixers = {
"\ 'javascript': ['eslint'],
"\ 'typescript': ['prettier', 'tslint'],
"\ 'vue': ['eslint'],
"\ 'scss': ['prettier'],
"\ 'html': ['prettier'],
"\ 'python': ['pylint'],
"\}
"let g:ale_fix_on_save = 1
"}}}
 "UltiSnips "{{{
"let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Replaced by fzf
"let g:UltiSnipsListSnippets="<c-l>" " List snippets by presing Ctrl+l in insert mode
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/ultisnips']
"}}}
 "Deoplete "{{{
"let g:deoplete#enable_at_startup = 1
 "call deoplete#custom#option('sources', {
    "\ 'Python': ['deoplete-jedi'],
    "\})
 "disable autocompletion, cause we use deoplete for completion
"let g:jedi#completions_enabled = 0
 "open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right"
 "system clipboard
 "Preserve indentation while pasting text from the OS X clipboard
 "noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
 "if hidden is not set, TextEdit might fail.
"}}}
" COC "{{{
" K = documentation
" Ctrl + space = intelisense
" gd = go to definition
" :Format = format
let g:coc_global_extensions = [
  \ 'coc-snippets', 
  \ 'coc-python', 
  \ 'coc-sh', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ ]
" Load UltiSnips
" Python linting and formatting
" JS Linter
" Lint and Format these: JavaScript / TypeScript / CSS / JSON
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"set hidden

"" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

"" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300

"" don't give |ins-completion-menu| messages.
"set shortmess+=c

"" always show signcolumns
"set signcolumn=yes

"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window
"nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>"}}}}}}
" Markdown Preview {{{
" :call StartMDPreview()
func! CompileMD()
  silent !pandoc -o /tmp/preview.pdf %
endfu
func! PreviewMD()
  silent !zathura /tmp/preview.pdf &
endfu
func! StartMDPreview()
  call CompileMD()
  autocmd BufWritePost *.md call CompileMD()
  call PreviewMD()
endfu
" }}}
