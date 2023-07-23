vim.g.mapleader = " "

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "\"'", "\"+")
vim.keymap.set("v", "\"'", "\"+")
vim.keymap.set("i", "<C-r>'", "<C-r>+")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
vim.keymap.set("n", "<leader>x", "!chmod +x %<CR>", { silent = true })

-- clang-format
vim.keymap.set("v", "<C-k><C-k>", ":!clang-format<CR>")
vim.keymap.set("n", "<C-k><C-k>", ":py3f /usr/share/clang/clang-format.py<CR>")

-- join lines w/o inserting a space
vim.keymap.set("n", "<M-j>", ":s/$\\n\\s*/<CR>``")
