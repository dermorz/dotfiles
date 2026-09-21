return {
    "junegunn/vim-easy-align",
    lazy = false,
    config = function()
        vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)")
    end,
}
