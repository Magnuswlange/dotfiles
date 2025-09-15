return {
  {
    "Vigemus/iron.nvim",
    config = function()
      require("iron.core").setup({
        config = {
          repl_definition = {
            python = {
              command = { "ipython" },
            },
          },
          repl_open_cmd = "botright 40 vsplit",
        },
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
      })
    end,
  }
}
