-- Package Configuration
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" }, 
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("plugins.colors")
require("plugins.lualine")
require("plugins.oil")
require("plugins.mini")
require("plugins.telescope")
