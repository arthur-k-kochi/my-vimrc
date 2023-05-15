if has("mac")
    let &t_ZH="\e[3m"
endif
syntax on
syntax enable
"colorscheme molokai
"set t_Co=256
set backspace=indent,eol,start
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set hidden
set cursorline
set cursorcolumn
set virtualedit=onemore
set wildmenu
inoremap jj <esc>
inoremap { {}<Left>
inoremap {} {}
inoremap {<Return> {}<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [] []
inoremap ( ()<Left>
inoremap () ()
inoremap " ""<Left>
inoremap "" ""
if expand("%:t") =~ ".*\.py"
    inoremap ' ''<Left>
    inoremap '' ''
endif
function! s:my_tabline() "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufners = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]
        let no = i
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill#'
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
"let &tabline = '%!' . s:SID_PREFIX() . 'my_tabline()'
set showtabline=2
nnoremap    [Tag]   <Nop>
for n in range(1, 9)
    execute 'nnoremap <silent> t' .n ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> tc :tablast <bar> tabnew<CR>
map <silent> tx :tabclose<CR>
map <silent> tn :tabnext<CR>
map <silent> tp :tabprevious<CR>
map <silent> tt :NERDTreeToggle<CR>
map ti <C-w>s
map ts <C-w>v
nnoremap vi <C-w>
nnoremap tl <C-w><C-l>
nnoremap tk <C-w><C-k>
nnoremap tj <C-w><C-j>
nnoremap th <C-w><C-h>
nnoremap tL <C-w>L
nnoremap tK <C-w>K
nnoremap tJ <C-w>J
nnoremap tH <C-w>H
nnoremap t+s <C-w>>
nnoremap t-s <C-w><
nnoremap t+i <C-w>+
nnoremap t-i <C-w>-
nnoremap t= <C-w>=
nnoremap trj <C-w>r
nnoremap trk <C-w>R
tnoremap jj <C-\><C-n>
" NeoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "installing NeoBundle..."
        :call system("git clone git@github.com:Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"------- Vim Plugins here -------"
"NeoBundle 'itchyny/lightline.vim'
set laststatus=2
set showmode
set showcmd
set ruler
NeoBundle 'preservim/nerdtree'
NeoBundle 'Yggdroot/indentLine'
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
endif
if has('python3')
    NeoBundle 'davidhalter/jedi-vim'
endif
if neobundle#is_installed('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#min_keyword_length = 3
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#auto_completion_start_length = 1
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()
"------- Vim Plugins end here ---"
let g:tokyonight_cursor = 'blue'
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:lightLine = {'colorscheme' : 'tokyonight'}
let g:airline_theme = "tokyonight"
colorscheme tokyonight
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight folded ctermbg=none
highlight EndOfBuffer ctermbg=none
