return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
        {
            "<C-h>",
            function()
                require("spectre").open()
            end,
            desc = "Replace in files titi (Spectre)",
        },
    },
}
