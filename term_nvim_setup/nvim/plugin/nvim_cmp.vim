function! LspSetupAll()
    if getfsize(@%) < 1000000
lua << EOF
    local cmp = require'cmp'
    local luasnip = require("luasnip")
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    cmp.setup({
        snippet = {
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
                      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                      ['<C-f>'] = cmp.mapping.scroll_docs(4),
                      ['<C-Space>'] = cmp.mapping.complete(),
                      ['<C-e>'] = cmp.mapping.abort(),
                      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                      ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                          cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                          luasnip.expand_or_jump()
                        elseif has_words_before() then
                          cmp.complete()
                        else
                          fallback()
                        end
                      end, { "i", "s" }),

                      ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                          cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                          luasnip.jump(-1)
                        else
                          fallback()
                        end
                      end, { "i", "s" }),
                    }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            -- { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            { name = 'buffer' ,
                option = {
                            keyword_length=3,
                            get_bufnrs = function()
                                          local bufs = {}
                                          for _, win in ipairs(vim.api.nvim_list_wins()) do
                                            bufs[vim.api.nvim_win_get_buf(win)] = true
                                          end
                                          return vim.tbl_keys(bufs)
                                        end,

                            }},
            { name = 'path' },
            -- { name = 'rg' },
        })
    })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      -- { name = 'cmdline' }
    })
  })
EOF
    endif
endfunction
call LspSetupAll()
