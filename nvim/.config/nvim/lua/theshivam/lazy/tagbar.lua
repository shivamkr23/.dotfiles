return {
    "majutsushi/tagbar",
    config = function()
        vim.keymap.set("n", "<leader>q", "<cmd>TagbarToggle<CR>")
    end
}
