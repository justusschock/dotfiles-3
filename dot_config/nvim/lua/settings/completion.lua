vim.api.nvim_exec([[
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd BufRead,BufNewFile *.md setlocal spell
]], true)

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end,
  },
  
  mapping = {
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
          -- ["<Tab>"] = cmp.mapping(
          --     function(fallback)
          --         if cmp.visible() then
          --             cmp.select_next_item()
          --         elseif has_words_before() then
          --             cmp.complete()
          --         else
          --             fallback()
          --         end
          --     end,
          --     {"i", "s"}
          -- ),
      -- ["<S-Tab>"] = cmp.mapping(
      --     function(fallback)
      --         if cmp.visible() then
      --             cmp.select_prev_item()
      --         else
      --             fallback()
      --         end
      --     end,
      --     {"i", "s"}
      -- ),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,

      before = function (entry, vim_item)
				return vim_item
      end
    })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'treesitter' },
    { name = 'tags' },
    { name = 'rg' },
  }),
})
-- Use buffer source for '/'
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
