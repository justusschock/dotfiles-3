local logo = {
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
}

return { 
    { 
        "goolord/alpha-nvim",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = logo
        end,
    }
}