" Plugin Definitions {{{
call plug#begin('~/.local/share/nvim/plugged')
" filetree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'


" comment in and out stuff
Plug 'tpope/vim-commentary'

" Git Extension
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


"Syntax Highlighting
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Indenting
Plug 'Vimjas/vim-python-pep8-indent'

" Linting
Plug 'dense-analysis/ale'

" python specific text objects
Plug 'jeetsukumaran/vim-pythonsense'

" autoinsert closing quotes and brackets
Plug 'jiangmiao/auto-pairs'

" Colorscheme
Plug 'joshdick/onedark.vim'

" requires ag to be installed: brew install the_silver_searcher
Plug 'ctrlpvim/ctrlp.vim'

" easy autosave feature
Plug '907th/vim-auto-save'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'majutsushi/tagbar'
"Plug 'edkolev/tmuxline.vim'

Plug 'NLKNguyen/papercolor-theme'

Plug 'christoomey/vim-tmux-navigator'

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'rhysd/vim-grammarous'
Plug 'davidbeckingsale/writegood.vim'

" Plug 'ludovicchabant/vim-gutentags'

Plug 'ekalinin/Dockerfile.vim'

Plug 'jceb/vim-orgmode'

Plug 'dpelle/vim-LanguageTool'

Plug 'folke/which-key.nvim'


" key binding
Plug 'sudormrfbin/cheatsheet.nvim'
" optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" replacement for cursorline in vim
Plug 'yamatsum/nvim-cursorline'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" code in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }


" time monitoring
" Plug 'wakatime/vim-wakatime'
call plug#end()

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
" }}}

" AutoSave {{{
let g:auto_save = 1 " enable autosave on startup
let g:aut_save_events = ["InsertLeave", "TextChanged"]
" }}}

" Tabs & Comments For Different File Types {{{
set tabstop=4
set softtabstop=4
set expandtab

au BufNewFile,BufRead *.py set foldmethod=indent
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
" }}}

"  Some UI Settings {{{
" show line numbers
set number
syntax on
" colorscheme onedark

" let g:airline#extensions#tabline#enabled = 1 " Allows airline to show open buffers if there is only one tab
" let g:airline_theme='simple' " Need to explore themes more

""" True colors
set termguicolors

set background=dark
colorscheme PaperColor
""" indent guides
let g:indentLine_setColors = 0

" TextEdit might fail if hidden is not set
set hidden

" more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=number

" show command in bottom bar
set showcmd

" highlight current line
" set cursorline " seems to be deprecated in nvim

" load filetype specific indent files
filetype indent on

" visual autocomplete for command menu
set wildmenu

" redraw only if necessary
set lazyredraw

" highlight matching paranthesis
set showmatch

" Seach: search as characters are entered and highlight matches
set incsearch
set hlsearch
set ignorecase
set smartcase


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"  }}}

" Code Folding {{{
" enable code folding
set foldenable

" enablemost folds by default
set foldlevelstart=10

set foldnestmax=10
set foldmethod=marker

nnoremap <space> za
"  }}}

" KeyMaps {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>et :vsp ~/.tmux.conf
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" save session
nnoremap <leader>s :mksession<CR>

" opens whichkey if no keystroke after leader
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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

""" Moving through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

"""""""""""" Nerd Tree """"""""""""
" Close vim if only window left is nerdtree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerdtree shortcut:
function! NERDTreeFindToggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
nnoremap <C-n> :call NERDTreeFindToggle()<CR>

"remove ? note
let NERDTreeMinimalUI = 1


"""""""""" Tagbar settings """""""""""""""
"nmap <F8> :TagbarToggle<CR>
"let g:tagbar_ctags_bin='/usr/local/bin/ctags'

"""""""""" gutentags settings """"""""""""
" Keep the tag files out of the projects:
"let g:gutentags_cache_dir='/tmp/gutentags/'

" } }}

" CtrlP settings {{{
" open ag.vim
nnoremap <leader>a :Ag
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" TMUX {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"  }}}

" B ackups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set autoread
au CursorHold,CursorholdI * :checktime
au FocusGained,BufEnter * :checktime
" }}}

" Custom Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" Linting {{{
" TODO: move to pylint, black and maybe mypy
let g:ale_linters = {
      \   'ansible': ['ansible-lint'],
      \   'bash': ['bashhate'],
      \   'bibtex': ['bibclean'],
      \   'json': ['jsonlint'],
      \   'latex': ['redpen'],
      \   'make': ['checkmake'],
      \   'markdown': ['redpen'],
      \   'python': ['flake8', 'pylint', 'mypy'],
      \   'restructuredtext': ['redpen'],
      \   'yaml': ['yamllint'],
      \}

" TODO: move to black
let g:ale_fixers = {
      \    '*': ['remove_trailing_lines', 'trim_whitespace'],
      \    'bash': ['shfmt'],
      \    'json': ['prettier'],
      \    'python': ['autoimport', 'black', 'isort'],
      \    'yaml': ['prettier'],
      \}
nmap <F6> :ALEFix<CR>
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_options = '--max-line-length=120'
let g:ale_python_flake8_options = '--max-line-length=120'
" Linter status in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" set statusline=
" set statusline+=%m
" set statusline+=\ %f
" set statusline+=%=
set statusline+=\ %{LinterStatus()}

""""" Py Doc Sting """""
nmap <silent> <Leader>d <Plug>(pydocstring)
"let g:pydocstring_templates_dir = '~/Documents/git/config_files/nvim/pydoc-templates'
let g:pydocstring_formatter = 'google'
let g:pydocstring_doq_path = '~/.local/bin/doq'

" }}}

" Coc-python IntelliSense {{{
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" vim:foldmethod=marker:foldlevel=0
