local M = {}

function M.setup()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.g.mapleader = " "             -- Set leader key
  vim.opt.termguicolors = true      -- Enable colors in terminal
  vim.opt.hlsearch = true           -- Set highlight on search
  vim.opt.number = true             -- Make line numbers default
  vim.opt.relativenumber = true     -- Make relative number default
  vim.opt.breakindent = true        -- Enable break indent
  vim.opt.pumheight = 10            -- Makes popup menu smaller
  vim.opt.undofile = true           -- Save undo history
  vim.opt.ignorecase = true         -- Case insensitive searching unless /C or capital in search
  vim.opt.smartcase = true          -- Smart case
  vim.opt.updatetime = 250          -- Decrease update time
  vim.opt.signcolumn = "yes"        -- Always show sign column
  vim.opt.clipboard = "unnamedplus" -- Access system clipboard
  vim.opt.scrolloff = 5             -- Lines of context
  vim.opt.termguicolors = true      -- True color support
  vim.opt.mouse = "a"               -- Enable mouse mode
  vim.opt.autowriteall = true       -- auto save
  vim.opt.showmode = false          -- Dont show mode since we have a statusline
  vim.opt.wrap = false              -- Disable line wrap
  vim.wo.cursorline = true          -- Enable highlighting of the current line
  vim.wo.fillchars='eob: '

  -- Set spell check
  vim.opt.spell = true              -- Enable spell check
  vim.opt.spelllang = "en_us"       -- Set spell check language
  vim.opt.spelloptions = "camel"    -- Set spell check to work with camelCase

  -- Set cursor shape
  vim.o.guicursor = "n-v-sm:block,i-ci-ve-c:ver25,r-cr-o:hor20"

  -- Normal tab setting
  vim.opt.smartindent = true        
  vim.bo.shiftwidth = 4             
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.textwidth = 120
  vim.bo.expandtab = true
end

return M
