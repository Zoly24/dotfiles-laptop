-- File: ~/.config/nvim/lua/plugins/clangd.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        settings = {
          cmd = { "clangd", "--log=verbose" },
        },
      },
    },
  },
}
