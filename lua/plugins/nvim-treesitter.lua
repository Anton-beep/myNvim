-- Configure lazy.nvim with nvim-treesitter
return {
  -- Add nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically run :TSUpdate after install
    config = function()
      require("nvim-treesitter.configs").setup({
        -- List of parsers to install
        ensure_installed = { "lua", "python", "javascript", "html", "css", "bash", "go", "rust" },

        -- Enable highlighting based on Treesitter
        highlight = {
          enable = true,              -- false will disable the whole extension
          additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting for performance
        },

        -- Enable incremental selection based on Treesitter
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },

        -- Enable Treesitter-based indentation
        indent = {
          enable = true
        },

        -- Optional: Enable other Treesitter modules
        -- playground, refactor, rainbow, etc.
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes
          persist_queries = false -- Whether queries should persist across vim sessions
        },

        -- Enable textobjects module for code manipulation
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- Track jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}

