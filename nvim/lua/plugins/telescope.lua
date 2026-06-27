-- Telescope Configuration
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = require("telescope.actions").close,
      },
    },
    sorting_strategy = "ascending"
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },

    live_grep = {
      theme = "ivy",
    },

    buffers = {
      theme = "ivy",
    },

    help_tags = {
      theme = "ivy",
    },

    lsp_document_symbols = {
      theme = "ivy",
    },

    lsp_workspace_symbols = {
      theme = "ivy",
    },
  },
})
