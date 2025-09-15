return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- Set up telescope with ui-select extension
      telescope.setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })

      -- Load ui-select extension
      telescope.load_extension("ui-select")

      -- Key mappings
      -- Disabled both of the below as I prefer fzf-lua for finding and live grepping files
      -- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
      -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
    end,
  },
}
