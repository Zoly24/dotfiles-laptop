return {
  {
    "neanias/everforest-nvim",
    background = "hard",
    config = function()
      --vim.o.background = dark, vim.cmd("colorscheme everforest")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      --vim.cmd("colorscheme rose-pine-moon")
    end,
  },
  {
    "Shadorain/shadotheme",
    config = function()
      vim.cmd("colorscheme shado-legacy")
    end,
  },
}
