-- LSP Configuration
vim.o.autocomplete = true

vim.diagnostic.config({
  virtual_text = true, 
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      },
      telemetry = {
        enable = false
      }
    }
  }
})

vim.lsp.enable({
  "lua_ls",
  "gopls",
  "ols"
})

