local add, now = MiniDeps.add, MiniDeps.now

add("eldritch-theme/eldritch.nvim")
add("savq/melange-nvim")
add("Yazeed1s/oh-lucy.nvim")
add("rebelot/kanagawa.nvim")
add("ptdewey/darkearth-nvim")

now(function()
  require("eldritch").setup()
  vim.cmd("colorscheme melange")
end)


