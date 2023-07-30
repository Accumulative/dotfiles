local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "S-Right", ":cnext<CR>", opts)
keymap("n", "S-Left", ":cprev<CR>", opts)
keymap("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":lua require('harpoon.ui').nav_next()<CR>", opts) -- was :bnext
keymap("n", "<S-h>", ":lua require('harpoon.ui').nav_prev()<CR>", opts) -- was :bprev

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("n", "Y", "yy", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- TODO finding
keymap("n", "<leader>t", ":noautocmd vimgrep /TODO/j ./src**/*<CR>:cw<CR>", opts)

-- TODO not working
keymap("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<CR>", opts)

-- insert uuid
-- nnoremap <silent><leader>iu "=system('python3 -c "import uuid; print(uuid.uuid4(), end=\"\");"')<CR>p

-- handled by lsp-zero now
--[[ keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) ]]
--[[ keymap("n", "K", "<cmd>lua vim.lsp.buf.hover({ focusable = false })<CR>", opts) ]]
--[[ keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) ]]
--[[ keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]
--[[ keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts) ]]
--[[ keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts) ]]
--[[ keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts) ]]
--[[ keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) ]]
keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- also set to F2 in lsp-zero
keymap("n", "<C-x>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- also set to F4 in lsp-zero
keymap("n", "g?", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "g:", "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>", opts)
