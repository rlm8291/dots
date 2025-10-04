-- Oil Neovim
local add, now = MiniDeps.add, MiniDeps.now

add({
  source = "stevearc/oil.nvim",
  depends = { 'echasnovski/mini.icons' }
})

now(function()
  require("oil").setup({
    view_options = {
      show_hidden = true
    }
  })
end)
