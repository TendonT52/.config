-- tab & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- correct spelling
-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true
-- vim.opt.spelloptions = "camel"

-- disable line wrap
vim.opt.wrap = false

-- Set proper render color
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Highlight cursor line
vim.opt.cursorline = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- Set to use Nerd Font
vim.g.have_nerd_font = true

-- Make line number default
vim.opt.number = true

-- Set relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = ""

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep sign column on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 200

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain white space characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "┊ ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing ESC in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
