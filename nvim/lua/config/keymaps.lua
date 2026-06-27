-- Keymap Configuration
local map = vim.keymap.set

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

-- Core
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear Search Highlight")
map("n", "<leader>w", "<cmd>write<CR>", "Write Buffer")
map("n", "<leader>q", "<cmd>quit<CR>", "Quit Window")
map("n", "<leader>x", "<cmd>x<CR>", "Write & Quit")

-- Windows
map("n", "<C-h>", "<C-w>h", "Window Left")
map("n", "<C-j>", "<C-w>j", "Window Down")
map("n", "<C-k>", "<C-w>k", "Window Up")
map("n", "<C-l>", "<C-w>l", "Window Right")

-- LSP 
map("n", "<leader>gd", vim.lsp.buf.definition, "Go To Definition")
map("n", "<leader>gD", vim.lsp.buf.declaration, "Go To Declaration")
map("n", "<leader>gR", vim.lsp.buf.references, "Go To References")
map("n", "<leader>gi", vim.lsp.buf.implementation, "Go To Implementation")
map("n", "<leader>gt", vim.lsp.buf.type_definition, "Go To Type Definition")
map("n", "K", vim.lsp.buf.hover, "Hover Documentation")

map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
map("n", "<leader>df", vim.diagnostic.open_float, "Line Diagnostic")
map("n", "<leader>dl", vim.diagnostic.setloclist, "Diagnostics List")

-- Oil 
map("n", "-", "<cmd>Oil<CR>","Open Parent Directory")

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader><leader>", builtin.find_files, "Find Files")
map("n", "<leader>sf", builtin.live_grep, "Search Files")
map("n", "<leader>sb", builtin.buffers, "Search Buffers")
map("n", "<leader>fh", builtin.help_tags, "Help Tags")

