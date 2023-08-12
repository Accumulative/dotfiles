-- lsp
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- harpoon
vim.keymap.set("n", "<leader>a", ":lua require('harpoon.ui').add_file()<CR>", { desc = "Add harpoon" })
vim.keymap.set("n", "<leader><space>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Show harpoon" })
vim.keymap.set("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Select harpoon 1", silent = true })
vim.keymap.set("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Select harpoon 2", silent = true })
vim.keymap.set("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Select harpoon 3", silent = true })
vim.keymap.set("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Select harpoon 4", silent = true })
vim.keymap.set("n", "<S-l>", ":lua require('harpoon.ui').nav_next()<CR>", { desc = "Next harpoon" }) -- was :bnext
vim.keymap.set("n", "<S-h>", ":lua require('harpoon.ui').nav_prev()<CR>", { desc = "Previous harpoon" }) -- was :bprev

-- resize
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize horizontal smaller" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize horizontal bigger" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize vertical smaller" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize vertical bigger" })

-- QOL vim improvements
vim.keymap.set("i", "jk", "<ESC>", { desc = "Esc alternative" })
vim.keymap.set("n", "Y", "yy", { desc = "Yank text" })

vim.keymap.set("v", "<", "<gv", { desc = "Maintain indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Maintain indent right" })

vim.keymap.set("v", "p", '"_dP', { desc = "Improved paste" })

vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move text down" })
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move text up" })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Wrapped move up" })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Wrapped move down" })

-- TODO finding
vim.keymap.set("n", "<leader>t", ":noautocmd vimgrep /TODO/j ./src**/*<CR>:cw<CR>", { desc = "Show TODOs" })

-- TODO not working
vim.keymap.set("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<CR>", { desc = "Expand current filepath" })
