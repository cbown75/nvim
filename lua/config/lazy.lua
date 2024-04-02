local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},
		-- import any extras modules here
		-- { import = "lazyvim.plugins.extras.ui.alpha" },
		-- { import = "lazyvim.plugins.extras.lsp.none-ls" },
		-- import copilot
		-- { import = "lazyvim.plugins.extras.coding.copilot" },
		-- golang programming
		-- { import = "lazyvim.plugins.extras.lang.go" },
		-- import/override with your plugins
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
	},
	install = { colorscheme = { "catppuccin", "catppuccin-mocha" } },
	checker = { enabled = true },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
