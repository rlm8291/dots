local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-- Add Options
add("nvim-mini/mini.pairs")
add("nvim-mini/mini.surround")
add("nvim-mini/mini.ai")
add("nvim-mini/mini.statusline")
add("nvim-mini/mini.notify")
add("nvim-mini/mini.sessions")
add("nvim-mini/mini.indentscope")
add("nvim-mini/mini.diff")
add("nvim-mini/mini.icons")

-- Immediate Configuration
now(function()
  require("mini.starter").setup()
  require("mini.sessions").setup()
  require("mini.icons").setup()
  require("mini.notify").setup()
  require("mini.pairs").setup()
  require("mini.surround").setup()
  require("mini.ai").setup()
  require("mini.indentscope").setup()
end)

now(function()
  require("mini.statusline").setup({
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode({})
        local git = MiniStatusline.section_git({})
        local diff = MiniStatusline.section_diff({})
        local diagnostics = MiniStatusline.section_diagnostics({})
        local lsp = MiniStatusline.section_lsp({})
        local filename = MiniStatusline.section_filename({})
        local fileinfo = MiniStatusline.section_fileinfo({})
        local location = "%l:%c"  -- Simple line:column format
        local search = MiniStatusline.section_searchcount({})
        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo",  strings = { git, diff, diagnostics, lsp } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineFilename", strings = { filename } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo, location, search } },
        })
      end,
      -- Content for inactive window(s)
      inactive = nil,
    },
    use_icons = true,
    set_vim_settings = true,
  })
end)

now(function()
  require("mini.diff").setup({
    view = {
      style = "sign" or "number",
      signs = {
        add = "+",
        change = "~",
        delete = "_"
      }
    }
  })
end)

-- Lazy Load
later(function()
  require("mini.pick").setup({
    window = {
      config = function()
        return {
          anchor = "NW",
          border = "rounded",
        }
      end
    }
  })

  require("mini.extra").setup({})
end)


