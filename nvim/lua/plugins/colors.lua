-- Color Configuration
vim.o.background = "dark"

require("rose-pine").setup({
  variant = "moon",
  dark_variant = "moon",
  styles = {
    bold = true, 
    italic = true, 
    transparency = false
  },
})

require("nightfox").setup({
  options = {
    transparent = false,
    terminal_colors = true,
    dim_inactive = false
  }
})

require("kanagawa").setup({
  theme = "wave", -- wave, dragon, lotus
  transparent = false,
})

vim.cmd.colorscheme("kanagawa")

