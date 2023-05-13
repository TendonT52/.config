local M = {}

function M.setup()
  local keymap = vim.api.nvim_set_keymap
  local default_opts = { noremap = true, silent = true }
  local expr_opts = { noremap = true, expr = true, silent = true }

  -- Center search results
  keymap("n", "n", "nzz", default_opts)
  keymap("n", "N", "Nzz", default_opts)

  -- Better indent
  keymap("v", "<", "<gv", default_opts)
  keymap("v", ">", ">gv", default_opts)

  -- Paste over currently selected text without yanking it
  keymap("v", "p", '"_dP', default_opts)

  -- Cancel search highlighting with ESC
  keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

end

return M