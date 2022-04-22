local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("jiangmiao/auto-pairs")
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
  use("ThePrimeagen/refactoring.nvim")
  -- use {"zeertzjq/which-key.nvim", branch = "patch-1"}
  use("folke/which-key.nvim")
  use("matze/vim-move")
  use("mg979/vim-visual-multi")
  use("tpope/vim-surround")
  use("metakirby5/codi.vim")
  use("tyru/open-browser.vim")
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({ "rrethy/vim-hexokinase", run = "make hexokinase" })
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        highlight = {
          before = "fg", -- "fg" or "bg" or empty
          after = "fg", -- "fg" or "bg" or empty
        },
      })
    end,
  })
  use("vimoxide/vim-quickscope")
  use("RishabhRD/popfix")
  use("RishabhRD/nvim-lsputils")
  use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
  use("junegunn/fzf.vim")
  use("andymass/vim-matchup")
  use({ "christianchiarulli/nvim-gps", branch = "text_hl" })
  use("godlygeek/tabular")
  use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
  use 'arcticicestudio/nord-vim'
  use("lunarvim/darkplus.nvim")
  use({
    "ray-x/lsp_signature.nvim",
  })

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("hrsh7th/cmp-calc") -- calculation completions
  use({ "github/copilot.vim" })
  -- use({
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- })
  -- use {
  --     "zbirenbaum/copilot-cmp",
  --     after = { "copilot.lua", "nvim-cmp" },
  -- }
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

  use("liuchengxu/vista.vim")
  use("kana/vim-narrow")
  use("rmagatti/goto-preview")
  use("preservim/tagbar")
  use({ "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" })
  use("szw/vim-maximizer")
  use("uga-rosa/translate.nvim")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("tami5/sqlite.lua")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "dhruvmanila/telescope-bookmarks.nvim",
    -- Uncomment if the selected browser is Firefox
    -- requires = {
    --   'tami5/sqlite.lua',
    -- }
  })
  use("cljoly/telescope-repo.nvim")
  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
      config = function()
        require("neoclip").setup()
      end,
    },
  })
  use({
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use("skanehira/gh.vim")

  -- Org Mode
  use({
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup({})
    end,
  })

  -- Tests
  use("haydenmeade/neotest-jest")
  use("nvim-neotest/neotest-vim-test")
  use("nvim-neotest/neotest-plenary")
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-plenary"),
          require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
          }),
        },
      })
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
