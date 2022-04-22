local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<M-Up>", ":resize -2<CR>", opts)
keymap("n", "<M-Down>", ":resize +2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Better window movement
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Close current buffer without close pane
vim.cmd('nmap ,c :bp<bar>sp<bar>bn<bar>bd<CR>')

-- Close all buffers but current
vim.cmd('nnoremap <silent> ;c :w <bar> %bd <bar> e# <bar> bd# <CR><CR>')

-- FZF
vim.cmd([[
  nnoremap <c-p> :Files <CR>
  nnoremap <c-f> :Rgi <CR>
  nnoremap <leader>; :BLines<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <silent> ,d :call fzf#run(fzf#wrap({'source': 'find $HOME/projects -maxdepth 2 -type d'}))<CR>
  nnoremap <leader>f :Rgi <C-R><C-W><CR>
  vnoremap <leader>f "ay:Rgi <C-r>a<CR>
]])

-- Refactoring
-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

-- goto-preview mappings
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap=true})

-- Dash
vim.api.nvim_set_keymap("n", ",f", "<cmd>:Dash<CR>", { noremap = true })
