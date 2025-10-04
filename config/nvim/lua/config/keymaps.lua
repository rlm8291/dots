-- Neovim
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Terminal
vim.keymap.set("n", "<leader>t", ":term<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-N>")

-- Selection
vim.keymap.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv")

-- Buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bdel<CR>")

-- Windows
vim.keymap.set("n", "<leader>bv", ":vsplit <CR>")
vim.keymap.set("n", "<leader>bh", ":split <CR>")

-- Window Navigation
vim.keymap.set("n", "<C-Left>", "<C-w><Left>")
vim.keymap.set("n", "<C-Down>", "<C-w><Down>")
vim.keymap.set("n", "<C-Up>", "<C-w><Up>")
vim.keymap.set("n", "<C-Right>", "<C-w><Right>")

-- Window Resize
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>")

-- LSP + Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover({ border = "rounded" }) end)
vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references)

-- Plugins
vim.keymap.set("n", "<leader>fe", ":Oil<CR>")
vim.keymap.set("n", "<leader>fo", function() require("oil").toggle_float() end)

-- Mini
vim.keymap.set("n", "<leader><leader>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>fc", function() require("mini.pick").builtin.files({}, { source = { cwd = vim.fn.expand("~/.config/nvim") } }) end)
vim.keymap.set("n", "<leader>fb", function() require("mini.pick").builtin.buffers() end)
vim.keymap.set("n", "<leader>fg", function() require("mini.pick").builtin.grep_live() end)
vim.keymap.set("n", "<leader>to", function() require("mini.diff").toggle_overlay() end)

