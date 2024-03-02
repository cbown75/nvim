vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "K", vim.lsp.buf.hover, {})
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
keymap.set("n", "<Leader>do", ":DapStepOver<CR>")

keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {})

keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

keymap.set("n", "<leader>sr", function() require("spectre").open() end, { desc = "Replace in files (Spectre)" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

keymap.set('n', '<leader>h', ':nohlsearch<CR>')