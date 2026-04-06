return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            qmlls = {
                -- Add these markers so the LSP can find your folder
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern(".git", "project.qmlproject", "shell.qml")(fname)
                end,
                settings = {
                    -- Help the LSP find your subfolders
                    importPaths = { ".", "./components", "./modules", "./core" },
                },
            },
        },
    },
}
