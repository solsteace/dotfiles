-- Refer to: https://github.com/hrsh7th/nvim-cmp/#setup
local cmp = require'cmp'

cmp.setup({
    snippet = { -- REQUIRED - you must specify a snippet engine
      expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = { 
		-- fallback means do whatever the keybinding originally does, if any (Excluding Ex)
		['<C-j>'] = cmp.mapping(function(fallback)
				if cmp.visible() then cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
				else fallback()
				end
			end, {'i', 'c'}),
		['<C-k>'] = cmp.mapping(function(fallback)
				if cmp.visible() then cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
				else fallback()
				end
			end, {'i', 'c'}),
		['<CR>'] = cmp.mapping(function(fallback)
				-- Set `select` to `false` to only confirm explicitly selected items.
				if cmp.visible() then cmp.confirm({ select = true }) 
				else fallback()
				end
			end, {'i'}),
	},
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
      { name = 'path',
	  	option = {
			trailing_slash = true,
			label_trailing_slash = false,
		},
	  },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

