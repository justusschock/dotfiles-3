return {
    {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb", "g<", "g>" },
        config = function()
            require('Comment').setup()
        end,
    },
}