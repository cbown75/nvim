return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	enabled = not vim.g.started_by_firenvim,
		-- stylua: ignore
		keys = {
			{ '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
			{ '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
			{ '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete other buffers' },
			{ '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the right' },
			{ '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the left' },
			{ '<leader>tp', '<Cmd>BufferLinePick<CR>', desc = 'Tab Pick' },
		},
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			show_close_icon = false,
			show_buffer_close_icons = false,
			diagnostics = "nvim_lsp",
			-- show_tab_indicators = true,
			-- enforce_regular_tabs = true,
			always_show_bufferline = true,
			-- indicator = {
			-- 	style = 'underline',
			-- },
			diagnostics_indicator = function(_, _, diag)
				local icons = require("lazyvim.config").icons.diagnostics
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			custom_areas = {
				right = function()
					local result = {}
					local root = LazyVim.root()
					table.insert(result, {
						text = "%#BufferLineTab# " .. vim.fn.fnamemodify(root, ":t"),
					})

					-- Session indicator
					if vim.v.this_session ~= "" then
						table.insert(result, { text = "%#BufferLineTab#  " })
					end
					return result
				end,
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "center",
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					---@diagnostic disable-next-line: undefined-global
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
