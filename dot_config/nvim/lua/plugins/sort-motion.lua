return {
    "christoomey/vim-sort-motion",
    keys = {
        { "gs", mode = { "n", "v" } },
    },
    config = function()
        -- Sort motion mappings
        -- gsip - sort inside paragraph
        -- gsa{ - sort around { brace block
        -- gsi[ - sort inside [ bracket
        -- etc.
    end,
}