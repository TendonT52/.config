return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = (
          function()
            local color = require("config.theme").color
            return {
              normal = {
                a = { bg = "NONE", fg = color.fg.green.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.green.dark },
                c = { bg = "NONE", fg = color.fg.green.dark }
              },
              insert = {
                a = { bg = "NONE", fg = color.fg.yellow.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.yellow.dark },
                c = { bg = "NONE", fg = color.fg.yellow.dark }
              },
              visual = {
                a = { bg = "NONE", fg = color.fg.magenta.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.magenta.dark },
                c = { bg = "NONE", fg = color.fg.magenta.dark }
              },
              replace = {
                a = { bg = "NONE", fg = color.fg.blue.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.blue.dark },
                c = { bg = "NONE", fg = color.fg.blue.dark }
              },
              command = {
                a = { bg = "NONE", fg = color.fg.red.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.red.dark },
                c = { bg = "NONE", fg = color.fg.red.dark }
              },
              inactive = {
                a = { bg = "NONE", fg = color.fg.white.bright, gui = 'bold' },
                b = { bg = "NONE", fg = color.fg.white.dark },
                c = { bg = "NONE", fg = color.fg.white.dark }
              }
            }
          end
        )(),
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  }
}
