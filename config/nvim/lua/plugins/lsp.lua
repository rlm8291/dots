local add, now = MiniDeps.add, MiniDeps.now

add({
  source = "mason-org/mason-lspconfig.nvim",
  depends = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  }
})

-- Vim LSP Configurations
now(function()
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim",
            "require",
            "MiniDeps",
            "MiniStatusline"
          },
        },
      },
    },
  })
end)

-- Setting up the LSP Tools
now(function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  require("mason-lspconfig").setup({
    automatic_enable = {
      "lua_ls",
      "vimls",
      "ols"
    }
  })
end)



