-- basic edit
vim.keymap.set('i', '<C-b>', "<Left>")
vim.keymap.set('i', '<C-f>', "<Right>")

-- project keymap
vim.keymap.set('n', '<leader>pv', "<cmd>Oil<cr>", {})

-- window operation kepmap
vim.keymap.set('n', '<leader>w-', "<C-w>s", {})
vim.keymap.set('n', '<leader>w/', "<C-w>v", {})
vim.keymap.set('n', '<leader>wh', "<C-w>h", {})
vim.keymap.set('n', '<leader>wj', "<C-w>j", {})
vim.keymap.set('n', '<leader>wk', "<C-w>k", {})
vim.keymap.set('n', '<leader>wl', "<C-w>l", {})
vim.keymap.set('n', '<leader>wc', "<C-w>c", {})

-- buffer keymap
vim.keymap.set('n', '<leader>bp', "<cmd>bprevious<cr>", {})
vim.keymap.set('n', '<leader>bn', "<cmd>bnext<cr>", {})
vim.keymap.set('n', '<leader>bd', "<cmd>BufDel<cr>", {})

vim.keymap.set('n', '<leader>fs', "<cmd>w<cr>", {})

-- terminal mode keymap
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', {})

-- quick fix
vim.keymap.set('n', '<leader>co', "<cmd>copen<cr>", {})
vim.keymap.set('n', '<leader>cn', "<cmd>cnext<cr>", {})
vim.keymap.set('n', '<leader>cp', "<cmd>cprevious<cr>", {})
