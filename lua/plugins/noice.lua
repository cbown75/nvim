return {
	"MunifTanjim/nui.nvim",
	lazy = false,
}, {
	"folke/noice.nvim",
	event = "VeryLazy",

	opts = function(_, opts)
		table.insert(opts.routes, {
			filter = {
				event = "notify",
				find = "No information available",
			},
			opts = { skip = true },
		})
		local focused = true
		vim.api.nvim_create_autocmd("FocusGained", {
			callback = function()
				focused = true
			end,
		})
		vim.api.nvim_create_autocmd("FocusLost", {
			callback = function()
				focused = false
			end,
		})
		table.insert(opts.routes, 1, {
			filter = {
				cond = function()
					return not focused
				end,
			},
			view = "notify_send",
			opts = { stop = false },
		})

		opts.commands = {
			all = {
				-- options for the message history that you get with `:Noice`
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {},
			},
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function(event)
				vim.schedule(function()
					require("noice.text.markdown").keys(event.buf)
				end)
			end,
		})

		opts.smart_move.enabled = true
		opts.presets.lsp_doc_border = true
		opts.presets.command_palette = true
		opts.presets.bottom_search = false
	end,

	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	---    config = function()
	vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDitmiss<CR>", {}),
	---    end,
}
