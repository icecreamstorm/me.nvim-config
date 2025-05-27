vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "gh", "0", { noremap = true, silent = true })
vim.keymap.set("n", "gl", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dt", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true })

--windows
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")

--glohel exit
vim.keymap.set("n", "q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope<CR>")
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_commmits<CR>")
vim.keymap.set("n", "<leader>Gf", "<cmd>GrugFar<CR>")
