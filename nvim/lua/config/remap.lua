vim.g.mapleader = " "
vim.keymap.set('n', '<leader>..', ':Neotree<CR>', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set({ "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


vim.keymap.set("n", "<C-q>", "<C-v>")

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>qa", "<cmd>qa!<CR>")

-- TAB
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<C-a>", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<C-s>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tq>", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })

vim.keymap.set("n", "vw", "viw", { desc = "Select current word" })
vim.keymap.set("n", "vW", "viW", { desc = "Select current WORD" })
vim.keymap.set("n", "vs", "viws", { desc = "Select current word and replace" })

vim.keymap.set("n", "<C-f>", [[:%s~~~gI<left><Left><Left><Left>]])
vim.keymap.set("x", "<C-f>", [[:s~~~gI<left><Left><Left><Left>]])

vim.keymap.set('n', '<C-p>', '"0p', { desc = "paste yanked text" })
vim.keymap.set('n', '<M-p>', '""p', { desc = "paste from default reg" })
