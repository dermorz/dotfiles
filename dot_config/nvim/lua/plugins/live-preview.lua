return {
    "brianhuster/live-preview.nvim",
    build = ":LivePreview",
    cmd = { "LivePreview" },
    keys = {
        { "<leader>mp", "<cmd>LivePreview<cr>", desc = "Start live preview" },
    },
    opts = {
        port = 8080,
        mermaid = {
            renderer = "beautiful",
            theme = "one-dark",
        },
    },
    dir = "/home/dermorz/code/live-preview.nvim",
}
