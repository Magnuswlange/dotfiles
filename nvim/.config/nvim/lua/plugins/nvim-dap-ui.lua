return {
	{
		"rcarriga/nvim-dap-ui",

		dependencies = {
			"mfussenegger/nvim-dap",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Define custom signs for DAP breakpoints and states
			vim.fn.sign_define("DapBreakpoint", {
				text = "⚪",
				texthl = "DapBreakpointSymbol",
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})

			vim.fn.sign_define("DapStopped", {
				text = "🔴",
				texthl = "Yellow", -- Highlight groups are case-sensitive; "Yellow" standard
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "⭕",
				texthl = "DapStoppedSymbol",
				linehl = "DapBreakpoint",
				numhl = "DapBreakpoint",
			})

			-- Setup dap-ui with minimal UI configuration
			dapui.setup({
				expand_lines = true,
				controls = { enabled = false }, -- disables play/step buttons in UI
				floating = { border = "rounded" },
				render = {
					max_type_length = 60,
					max_value_lines = 200,
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 1.0 }, -- 100% panel = scopes
						},
						size = 15, -- height in lines
						position = "bottom", -- position of panel
					},
				},
			})

			-- Open/close dap-ui automatically on debug events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Keymappings for DAP UI eval and toggle
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader>du", function()
				dapui.toggle()
			end, vim.tbl_extend("force", opts, { desc = "Toggle DAP UI" }))
			map({ "n", "v" }, "<leader>dw", function()
				dapui.eval(nil, { enter = true })
			end, vim.tbl_extend("force", opts, { desc = "Add word under cursor to Watches" }))
			map(
				{ "n", "v" },
				"Q",
				function()
					dapui.eval()
				end,
				vim.tbl_extend("force", opts, {
					desc = "Hover/eval a single value (opens a tiny window instead of expanding full object)",
				})
			)
		end,
	},
}
