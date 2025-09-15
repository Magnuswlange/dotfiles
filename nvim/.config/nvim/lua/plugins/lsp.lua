-- LSP servers, install formatters within null_ls
local servers = {
  "lua_ls",
  "arduino_language_server",
  "dockerls",
  "docker_compose_language_service",
  "bashls",
  "clangd",
  "cmake",
  "pyright",
  "ruff",
  "ts_ls",
  "jsonls", -- instead of json-lsp
  "html",  -- instead of html-lsp
  "cssls", -- instead of css-lsp
  -- roslyn for C# isn't available so we install manually :MasonInstall roslyn
}

return {
  {
    "williamboman/mason.nvim",

    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = servers,
    },
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- HANDLE PYRIGHT
      -- for _, server in ipairs(servers) do
      -- 	if server == "pyright" then
      -- 		local util = require("lspconfig.util")
      --
      -- 		lspconfig.pyright.setup({
      -- 			capabilities = capabilities,
      -- 			settings = {
      -- 				python = {
      -- 					pythonPath = "/home/cool_kid/venv/bin/python",
      -- 				},
      -- 			},
      -- 			root_dir = util.root_pattern(".git", "pyproject.toml", "requirements.txt"),
      -- 		})
      -- 	else
      -- 		lspconfig[server].setup({
      -- 			capabilities = capabilities,
      -- 		})
      -- 	end
      -- end

      -- Common LSP keybindings
      local map = vim.keymap.set
      map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      map("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to References" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
}
