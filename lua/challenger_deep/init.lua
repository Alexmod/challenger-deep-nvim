local M = {}

M.colors = {
  asphalt        = '#1e1c31',
  asphalt_subtle = '#100E23',
  dark_asphalt   = '#565575',
  red            = '#ff8080',
  dark_red       = '#ff5458',
  green          = '#95ffa4',
  dark_green     = '#62d196',
  yellow         = '#ffe9aa',
  dark_yellow    = '#ffb378',
  blue           = '#91ddff',
  dark_blue      = '#65b2ff',
  purple         = '#c991e1',
  dark_purple    = '#906cff',
  cyan           = '#aaffe4',
  dark_cyan      = '#63f2f1',
  clouds         = '#cbe3e7',
  dark_clouds    = '#a6b3cc',
  medium_gray    = '#767676',
}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup(opts)
  opts = opts or {}
  local c = M.colors
  local bg = opts.transparent and 'NONE' or c.asphalt

  vim.opt.termguicolors = true

  -- Base editor
  highlight('Normal',        { fg = c.clouds, bg = bg })
  highlight('Comment',       { fg = c.medium_gray, italic = true })
  highlight('Constant',      { fg = c.yellow })
  highlight('String',        { fg = c.yellow })
  highlight('Number',        { fg = c.dark_yellow })
  highlight('Identifier',    { fg = c.purple })
  highlight('Statement',     { fg = c.red })
  highlight('PreProc',       { fg = c.green })
  highlight('Type',          { fg = c.blue })
  highlight('Special',       { fg = c.cyan })
  highlight('Underlined',    { fg = c.clouds, underline = true })

  -- Treesitter
  highlight('@comment',      { link = 'Comment' })
  highlight('@variable',     { link = 'Identifier' })
  highlight('@string',       { link = 'String' })
  highlight('@number',       { link = 'Number' })
  highlight('@constant',     { link = 'Constant' })
  highlight('@function',     { link = 'Function' })
  highlight('@keyword',      { link = 'Statement' })

  -- Diagnostics
  highlight('DiagnosticError', { fg = c.dark_red })
  highlight('DiagnosticWarn',  { fg = c.dark_yellow })
  highlight('DiagnosticInfo',  { fg = c.dark_blue })
  highlight('DiagnosticHint',  { fg = c.dark_cyan })

  -- GitSigns
  highlight('GitSignsAdd',    { fg = c.green })
  highlight('GitSignsChange', { fg = c.yellow })
  highlight('GitSignsDelete', { fg = c.red })

  -- Telescope
  highlight('TelescopeBorder', { fg = c.dark_cyan })
  highlight('TelescopePromptTitle', { fg = c.cyan, bold = true })
  highlight('TelescopeResultsTitle', { fg = c.purple, bold = true })

  -- indent-blankline
  highlight('IndentBlanklineChar', { fg = c.dark_asphalt })
  highlight('IndentBlanklineContextChar', { fg = c.dark_blue })

  -- WhichKey / Notify / noice
  highlight('WhichKey',      { fg = c.blue })
  highlight('NotifyBackground', { bg = c.asphalt_subtle })
  highlight('NoicePopup',    { fg = c.clouds, bg = c.asphalt_subtle })

  -- cmp glowing border
  highlight('CmpBorder', { fg = c.dark_purple })

  -- nvim-web-devicons
  highlight('DevIconDefault', { fg = c.blue })

  -- Tabline (native Neovim :tabs)
  highlight('TabLine',     { fg = c.medium_gray, bg = c.asphalt })
  highlight('TabLineSel',  { fg = c.asphalt_subtle, bg = c.blue, bold = true })
  highlight('TabLineFill', { fg = c.medium_gray, bg = c.asphalt })

  -- Lualine auto theme
  pcall(function()
    require('lualine').setup {
      options = {
        theme = {
          normal = { c = { fg = c.clouds, bg = c.dark_asphalt }},
          insert = { c = { fg = c.asphalt_subtle, bg = c.green }},
          visual = { c = { fg = c.asphalt_subtle, bg = c.dark_blue }},
          replace = { c = { fg = c.asphalt_subtle, bg = c.dark_red }},
          command = { c = { fg = c.asphalt_subtle, bg = c.yellow }},
          inactive = { c = { fg = c.medium_gray, bg = c.asphalt }},
        },
        component_separators = '',
        section_separators = '',
      }
    }
  end)

-- Bufferline auto theme
pcall(function()
  require("bufferline").setup {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
    },
    highlights = {
      fill = { guifg = c.medium_gray, guibg = c.asphalt },
      background = { guifg = c.medium_gray, guibg = c.asphalt },
      buffer_visible = { guifg = c.clouds, guibg = c.asphalt },
      buffer_selected = { guifg = c.asphalt_subtle, guibg = c.blue, gui = "bold" },
      tab = { guifg = c.medium_gray, guibg = c.asphalt },
      tab_selected = { guifg = c.asphalt_subtle, guibg = c.blue, gui = "bold" },
      separator = { guifg = c.asphalt, guibg = c.asphalt },
      separator_selected = { guifg = c.blue, guibg = c.blue },
      indicator_selected = { guifg = c.blue, guibg = c.blue },
      close_button = { guifg = c.medium_gray, guibg = c.asphalt },
      close_button_selected = { guifg = c.asphalt_subtle, guibg = c.blue },
      modified = { guifg = c.dark_yellow, guibg = c.asphalt },
      modified_selected = { guifg = c.dark_yellow, guibg = c.blue },
    }
  }
end)
end

return M
