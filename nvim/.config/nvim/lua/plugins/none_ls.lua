return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-luacheck.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")
    -- local extras = require("none-ls.diagnostics.ruff")

    -- custom Csharpier formatter source definition
    local csharpier = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "cs" },
      generator = helpers.formatter_factory({
        command = "csharpier",
        args = { "--stdin" },
        to_stdin = true,
      }),
    }

    null_ls.setup({
      sources = {
        -- Python
        require("none-ls.formatting.ruff"),
        require("none-ls.diagnostics.ruff"),
        null_ls.builtins.diagnostics.mypy,

        -- JS/TS
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.prettier,

        -- Lua
        require("none-ls-luacheck.diagnostics.luacheck"),
        null_ls.builtins.formatting.stylua,

        -- C#
        csharpier,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
