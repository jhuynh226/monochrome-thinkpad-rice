-- Word wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

--Space for leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

--Lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  -- File icons (for Neo-tree)
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },

  -- Theme: Moonfly
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme moonfly]])
    end,
  },

  -- NUI (required by Neo-tree)
  { "MunifTanjim/nui.nvim" },

  -- Neo-tree (file explorer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        window = { position = "left", width = 30 },
      })

      -- Toggle Neo-tree sidebar with <leader>e
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { silent = true })
    end,
  },

  -- Surround text easily
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
})
