vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Bootstrap lazy.nvim (auto-installs itself)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key (space is common)
vim.g.mapleader = " "

-- Your plugins go here
require("lazy").setup({
{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
    },
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep text' },
  },
},
})
