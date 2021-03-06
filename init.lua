require "user.keymaps"
require "user.plugins"
require "user.colorscheme"

vim.cmd("source ~/.config/nvim/vimscripts/fzf.vim")
vim.cmd("source ~/.config/nvim/vimscripts/hexokinase.vim")
vim.cmd("source ~/.config/nvim/vimscripts/quickscope.vim")
vim.cmd("source ~/.config/nvim/vimscripts/vim-move.vim")
vim.cmd("source ~/.config/nvim/vimscripts/gh.vim")

require "user.alpha"
require "user.autocommands"
require "user.bufferline"
require "user.cmp"
require "user.comment"
require "user.diffview"
require "user.gitsigns"
require "user.goto-preview"
require "user.impatient"
require "user.indentline"
require "user.lsp"
require "user.lsp-utils"
require "user.lualine"
require "user.nvim-tree"
require "user.options"
require "user.project"
require "user.refactoring"
require "user.telescope"
require "user.toggleterm"
require "user.treesitter"
require "user.trouble"
require "user.nvim-gps"
require "user.winbar"
require "user.whichkey"
require "user.colors"
