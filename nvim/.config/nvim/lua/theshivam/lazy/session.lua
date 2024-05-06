return {
    {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            })
            vim.keymap.set("n", '<leader>r', "<cmd>SessionRestore<cr>")
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require('project_nvim').setup()
            require('telescope').load_extension('projects')
            vim.keymap.set("n", '<leader>x', function() require'telescope'.extensions.projects.projects{} end)
        end,
    },
    {
        'natecraddock/workspaces.nvim',
        config = function()
            require('workspaces').setup()
            require('telescope').load_extension('workspaces')
            vim.keymap.set("n", '<leader>w', function() require'telescope'.extensions.workspaces.workspaces{} end)
        end,
    },
}
