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

-- ============================================
-- Basic options
-- ============================================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.ruler = true

vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

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
-- Colorscheme
-- ============================================

vim.cmd.colorscheme("torte")

-- ============================================
-- Highlight customization
-- ============================================

vim.cmd([[
  highlight Error ctermfg=black ctermbg=red cterm=bold
  highlight ErrorMsg ctermfg=black ctermbg=red cterm=bold
  highlight MoreMsg ctermfg=black ctermbg=red cterm=bold
]])

-- ============================================
-- netrw
-- ============================================

vim.g.netrw_altv = 1
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_fastbrowse = 2
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25

-- ============================================
-- Window resizing
-- ============================================

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

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
})
