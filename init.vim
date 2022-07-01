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
set colorcolumn=80,120
set signcolumn=yes
set relativenumber
set noswapfile
set nobackup
set incsearch

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'tomasiser/vim-code-dark'
    Plug 'apzelos/blamer.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'preservim/nerdtree'
    Plug 'ntpeters/vim-better-whitespace'
    Plug '907th/vim-auto-save'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'voldikss/vim-floaterm'
    Plug 'Yggdroot/indentLine'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'github/copilot.vim'
    " For vsnip user.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    " For plantuml.
    Plug 'tyru/open-browser.vim'
    Plug 'aklt/plantuml-syntax'
    Plug 'weirongxu/plantuml-previewer.vim'
    " Vim-cpp-helper
    Plug 'd86leader/vim-cpp-helper'

call plug#end()

let g:cpp_helper_header_extension = ".hpp"
let g:cpp_helper_source_extension = ".cpp"
let g:cpp_helper_inclusion_guard_flavour = 1
let g:cpp_helper_inclusion_guard_format = "_%s_HPP"

let g:airline#extensions#tagbar#enabled = 1
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_relative_time = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 1
let g:blamer_relative_time = 1
:set list lcs=tab:\|\ 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
lua << EOF
require'lspconfig'.clangd.setup{}
local servers = { 'clangd' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

set completeopt=menu,menuone

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        --For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

     { name = 'buffer' },
    }
  })

  -- Setup lspconfig.
  require('lspconfig').clangd.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
    },
  playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
    }
}
EOF


nnoremap <silent>ff <cmd>Telescope find_files<cr>
nnoremap <silent>fg <cmd>Telescope live_grep<cr>
nnoremap <silent>fl <cmd>lua require'telescope.builtin'.live_grep{ search_dirs={"%:p"} }<cr>

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
"nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
"nnoremap <silent> <Leader>gs :YcmCompleter GoToSymbol<CR>
"nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-N>:FloatermToggle<CR>
colorscheme codedark
set termguicolors
"nmap <silent> gD :call CocAction('jumpDeclaration')<CR>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-@> coc#refresh()
"autocmd VimEnter * Tagbar
