-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ============================================
-- Basic options
-- ============================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.ruler = true

vim.g.editorconfig = false
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.autoindent = false
vim.opt.smartindent = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.completeopt = { "menu", "menuone", "popup", "noselect" }

vim.opt.wildmenu = true

vim.opt.splitright = false

vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

-- quick fix window show index
vim.o.quickfixtextfunc = "{info -> v:lua._G.qftf(info)}"

function _G.qftf(info)
  local items = vim.fn.getqflist({ id = info.id, items = 0 }).items
  local ret = {}

  for idx, item in ipairs(items) do
    local filename = vim.fn.bufname(item.bufnr)

    table.insert(ret,
      string.format("%3d %d:%d %s %s",
        idx,
        item.lnum,
        item.col,
        filename,
        item.text))
  end

  return ret
end

vim.opt.wildignore = {
  "*.docx",
  "*.jpg",
  "*.png",
  "*.gif",
  "*.pdf",
  "*.pyc",
  "*.exe",
  "*.flv",
  "*.img",
  "*.xlsx",
}

vim.opt.compatible = false

vim.opt.undofile = true

local undo_dir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undo_dir

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end

vim.opt.modeline = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.belloff = "all"

vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Uncomment if you want recursive file searching
-- vim.opt.path:append("**")

-- ============================================
-- Create undo directory if missing
-- ============================================

local undo_dir = vim.fn.expand("~/.vim/undo")

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end

-- ============================================
-- Syntax / filetype
-- ============================================

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- ============================================
-- Highlight customization
-- ============================================

vim.cmd([[
  highlight Error ctermfg=black ctermbg=red cterm=bold
  highlight ErrorMsg ctermfg=black ctermbg=red cterm=bold
  highlight MoreMsg ctermfg=black ctermbg=red cterm=bold
]])

-- ============================================
-- Plugins
-- ============================================

require("lazy").setup({
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "octol/vim-cpp-enhanced-highlight",
    ft = { "c", "cpp", "h", "hpp" },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      close_if_last_window = true,
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree filesystem reveal left<cr>",
        desc = "Neo-tree reveal",
      },
      {
        "<leader>E",
        "<cmd>Neotree filesystem toggle left<cr>",
        desc = "Neo-tree toggle",
      },
    },
  },
})

-- ============================================
-- Colorscheme
-- ============================================

vim.cmd([[colorscheme tokyonight-night]])

-- ============================================
-- Window resizing
-- ============================================

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
