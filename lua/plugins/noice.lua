return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {

    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
---    config = function()
    vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {})
---    end,
}
