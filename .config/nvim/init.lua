-- Define the core function to load Matugen colors or the fallback.
local function source_matugen()
    local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua"
    local file, err = io.open(matugen_path, "r")
    if err ~= nil then
        vim.cmd("colorscheme base16-catppuccin-mocha")
        vim.print("Matugen style file not found, using fallback theme.")
    else
        dofile(matugen_path)
        io.close(file)
    end
end

-- Main entrypoint on matugen reloads (triggered by SIGUSR1 signal)
local function auxiliary_function()
    source_matugen()
    vim.api.nvim_set_hl(0, "Comment", { italic = true })
end

-- Register an autocmd to listen for the SIGUSR1 signal from Matugen (Hot Reload)
vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    callback = auxiliary_function,
})

-- Bootstrap lazy.nvim and load all plugins LAST
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        source_matugen()
    end,
})
