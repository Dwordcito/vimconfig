"2021-08-31 02:59:00

let g:airline_theme = 'codedark'
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set hidden
set nowrap
set incsearch
set noshowmode
set colorcolumn=120
set signcolumn=yes
set relativenumber
set noswapfile
set nobackup
set background=dark
set incsearch

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'apzelos/blamer.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tomasiser/vim-code-dark'
    Plug 'majutsushi/tagbar'
    Plug 'preservim/nerdtree'
    Plug 'ntpeters/vim-better-whitespace'
    Plug '907th/vim-auto-save'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'Valloric/YouCompleteMe'
    Plug 'voldikss/vim-floaterm'
call plug#end()

colorscheme codedark
let g:airline#extensions#tagbar#enabled = 1
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_relative_time = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 1
let g:blamer_relative_time = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

nnoremap <silent>ff <cmd>Telescope find_files<cr>
nnoremap <silent>fg <cmd>Telescope live_grep<cr>
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

imap <Leader>ds     <C-R>=strftime("%Y-%m-%d %T")<CR>
imap <Leader>ymd    <C-R>=strftime("%Y-%m-%d")<CR>
imap <Leader>mdy    <C-R>=strftime("%m/%d/%y")<CR>
imap <Leader>Mdy    <C-R>=strftime("%b %d, %Y")<CR>
imap <Leader>hms    <C-R>=strftime("%T")<CR>
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gs :YcmCompleter GoToSymbol<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-N>:FloatermToggle<CR>
"nmap <silent> gD :call CocAction('jumpDeclaration')<CR>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-@> coc#refresh()
autocmd VimEnter * Tagbar
