return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "css-lsp",
        "luacheck",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
      })
    end,
  },
  -- {
  --   "sontungexpt/better-diagnostic-virtual-text",
  --   config = function()
  --     vim.diagnostic.config({ update_in_insert = true, virtual_text = false })
  --     local options = {
  --       ui = {
  --         wrap_line_after = false, -- wrap the line after this length to avoid the virtual text is too long
  --         left_kept_space = 3, --- the number of spaces kept on the left side of the virtual text, make sure it enough to custom for each line
  --         right_kept_space = 3, --- the number of spaces kept on the right side of the virtual text, make sure it enough to custom for each line
  --         -- arrow = "  ",
  --         arrow = " ⟵ ",
  --         -- arrow = " 🡰 ",
  --         -- arrow = " 🡐 ",
  --         up_arrow = "  ",
  --         down_arrow = "  ",
  --         above = false, -- the virtual text will be displayed above the line
  --       },
  --       priority = 0, -- the priority of virtual text
  --       inline = false,
  --     }
  --     require("better-diagnostic-virtual-text").setup(options)
  --   end,
  --   event = "BufRead",
  -- },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = {
          spacing = 4,
          source = "if_many",
          -- prefix = " ⟵ ",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          prefix = "icons",
        },
      },
    },
  },
}
