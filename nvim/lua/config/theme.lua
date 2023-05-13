local M = {}

M.color = {
  bg = {
    normal = {
      bright = "#363C44",
      dark = "#20242C",
    },
    floating = {
      bright = "#4F5358",
      dark = "#26272D",
    },
    red = "#300A0D",
    yellow = "#302E0A",
    green = "#0D3018",
    blue = "#0D0D30",
    magenta = "#300D30",
    cyan = "#0D302F",
  },
  fg = {
    white = {
      bright = "#B9B9B9",
      dark = "#5A5A5A",
    },
    red = {
      bright = "#FF616E",
      dark = "#9B2B39",
    },
    yellow = {
      bright = "#E2E274",
      dark = "#6F7144",
    },
    green = {
      bright = "#92DF7E",
      dark = "#496D48",
    },
    cyan = {
      bright = "#89E7D1",
      dark = "#4C7B70",
    },
    blue = {
      bright = "#A09EFF",
      dark = "#4C5382",
    },
    magenta = {
      bright = "#E581E8",
      dark = "#794382",
    },
  }
}

function M.highlight(group, style)
  local fg = style.fg and style.fg or "NONE"
  local bg = style.bg and style.bg or "NONE"
  local attr = style.attr and style.attr or "NONE"

  local clear = string.format("highlight clear %s", group)
  local cmd = string.format("highlight %s guifg=%s guibg=%s gui=%s", group, fg, bg, attr)
  vim.cmd(clear)
  vim.cmd(cmd)
end

function M.setup()
  -- Set color of the current line
  M.highlight("Normal", { fg = M.color.fg.white.bright })
  M.highlight("NonText", { fg = M.color.fg.white.bright })
  M.highlight("TermCursor", { bg = M.color.bg.normal.bright })
  M.highlight("CursorLine", { bg = M.color.bg.normal.dark })
  M.highlight("Visual", { bg = M.color.bg.normal.bright })
  M.highlight("Pmenu", { bg = M.color.bg.floating.dark })
  M.highlight("PmenuSel", { bg = M.color.bg.floating.bright })
  M.highlight("LineNr", { fb = M.color.fg.white.dark })
  M.highlight("CursorLineNr", { fb = M.color.fg.white.bright, bg = M.color.bg.normal.bright, attr = "bold" })
  M.highlight("SignColumn", { fb = M.color.fg.white.dark })

  M.highlight("Error", { fg = M.color.fg.white.bright, bg = M.color.bg.red })
  M.highlight("Todo", { fg = M.color.fg.blue.dark })
  M.highlight("String", { fg = M.color.fg.green.bright })
  M.highlight("Constant", { fg = M.color.fg.yellow.bright })
  M.highlight("Character", { fg = M.color.fg.yellow.bright })
  M.highlight("Number", { fg = M.color.fg.yellow.bright })
  M.highlight("Boolean", { fg = M.color.fg.yellow.bright })
  M.highlight("Float", { fg = M.color.fg.yellow.bright })
  M.highlight("Function", { fg = M.color.fg.blue.bright })
  M.highlight("Identifier", { fg = M.color.fg.red.bright })
  M.highlight("Conditional", { fg = M.color.fg.magenta.bright })
  M.highlight("Statement", { fg = M.color.fg.magenta.bright })
  M.highlight("Repeat", { fg = M.color.fg.magenta.bright })

  M.highlight("Label", { fg = M.color.fg.magenta.bright })
  M.highlight("Operator", { fg = M.color.fg.magenta.bright })
  M.highlight("Keyword", { fg = M.color.fg.magenta.bright })
  M.highlight("Exception", { fg = M.color.fg.magenta.bright })
  M.highlight("Include", { fg = M.color.fg.blue.bright })
  M.highlight("PreProc", { fg = M.color.fg.yellow.bright })
  M.highlight("Define", { fg = M.color.fg.magenta.bright })
  M.highlight("Macro", { fg = M.color.fg.magenta.bright })
  M.highlight("PreCondit", { fg = M.color.fg.yellow.bright })
  M.highlight("StorageClass", { fg = M.color.fg.yellow.bright })
  M.highlight("Type", { fg = M.color.fg.yellow.bright })
  M.highlight("Structure", { fg = M.color.fg.yellow.bright })
  M.highlight("Typedef", { fg = M.color.fg.yellow.bright })
  M.highlight("Tag", { fg = M.color.fg.white.bright })
  M.highlight("Special", { fg = M.color.fg.blue.bright })
  M.highlight("SpecialChar", { fg = M.color.fg.yellow.bright })
  M.highlight("Delimiter", { fg = M.color.fg.white.bright })
  M.highlight("SpecialComment", { fg = M.color.fg.cyan.dark })
  M.highlight("Debug", { fg = M.color.fg.magenta.dark })
  M.highlight("MatchParen", { fg = M.color.fg.white.bright })

  -- Set all spelling mistake to use underline
  M.highlight("SpellBad", { attr = "undercurl" })
  M.highlight("SpellLocal", { attr = "undercurl" })
  M.highlight("SpellRare", { attr = "undercurl" })
  M.highlight("SpellCap", { attr = "undercurl" })

  -- Set color of treesitter
  M.highlight("@text.literal", { fg = M.color.fg.white.bright })
  M.highlight("@text.reference", { fg = M.color.fg.blue.bright })
  M.highlight("@text.title", { fg = M.color.fg.red.bright })
  M.highlight("@text.uri", { fg = M.color.fg.white.bright, attr = "underline" })
  M.highlight("@text.underline", { fg = M.color.fg.white.bright, attr = "underline" })
  M.highlight("@text.todo", { fg = M.color.fg.yellow.bright })

  M.highlight("@comment", { fg = M.color.fg.white.dark })
  M.highlight("@punctuation", { fg = M.color.fg.white.bright })
  M.highlight("@constant", { fg = M.color.fg.yellow.bright })

  M.highlight("@constant.builtin", { fg = M.color.fg.yellow.bright })
  M.highlight("@constant.macro", { fg = M.color.fg.yellow.bright })
  M.highlight("@define", { fg = M.color.fg.magenta.bright })
  M.highlight("@macro", { fg = M.color.fg.red.bright })
  M.highlight("@string", { fg = M.color.fg.green.bright })
  M.highlight("@string.escape", { fg = M.color.fg.blue.bright })
  M.highlight("@string.special", { fg = M.color.fg.yellow.bright })

  M.highlight("@character", { fg = M.color.fg.yellow.bright })
  M.highlight("@character.special", { fg = M.color.fg.red.bright })
  M.highlight("@number", { fg = M.color.fg.yellow.bright })
  M.highlight("@boolean", { fg = M.color.fg.yellow.bright })
  M.highlight("@float", { fg = M.color.fg.yellow.bright })

  M.highlight("@function", { fg = M.color.fg.blue.bright })
  M.highlight("@function.builtin", { fg = M.color.fg.cyan.bright })
  M.highlight("@function.macro", { fg = M.color.fg.cyan.bright })
  M.highlight("@parameter", { fg = M.color.fg.red.bright })
  M.highlight("@method", { fg = M.color.fg.blue.bright })
  M.highlight("@field", { fg = M.color.fg.magenta.bright })
  M.highlight("@property", { fg = M.color.fg.cyan.bright })
  M.highlight("@constructor", { fg = M.color.fg.blue.bright })

  M.highlight("@conditional", { fg = M.color.fg.magenta.bright })
  M.highlight("@repeat", { fg = M.color.fg.magenta.bright })
  M.highlight("@label", { fg = M.color.fg.red.bright })
  M.highlight("@operator", { fg = M.color.fg.magenta.bright })
  M.highlight("@keyword", { fg = M.color.fg.magenta.bright })
  M.highlight("@exception", { fg = M.color.fg.magenta.bright })

  M.highlight("@variable", { fg = M.color.fg.red.bright })
  M.highlight("@type", { fg = M.color.fg.yellow.bright })
  M.highlight("@type.definition", { fg = M.color.fg.yellow.bright })
  M.highlight("@storageclass", { fg = M.color.fg.yellow.bright })
  M.highlight("@structure", { fg = M.color.fg.yellow.bright })
  M.highlight("@namespace", { fg = M.color.fg.yellow.bright })
  M.highlight("@include", { fg = M.color.fg.magenta.bright })
  M.highlight("@preproc", { fg = M.color.fg.magenta.bright })
  M.highlight("@debug", { fg = M.color.fg.yellow.bright })
  M.highlight("@tag", { fg = M.color.fg.green.bright })

end

return M
