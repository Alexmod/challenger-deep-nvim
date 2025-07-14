![Challenger Deep](https://challenger-deep-theme.github.io/images/logo.png)

## Challenger Deep for Neovim


A modern Lua color scheme with plugin integrations and a matching lualine theme.

### Installation

Use your favourite plugin manager.

**lazy.nvim**
```lua
{ 'challenger-deep-theme/challenger-deep-nvim', priority = 1000, lazy = false }
=======
To enable this color scheme with **Neovim**, use the Lua setup function and then
load the colorscheme:
```lua
require('challenger_deep').setup({
  transparent = true,
})
vim.cmd('colorscheme challenger_deep')
```

### Terminal True Color Support ###
  Add this to your .vimrc to enable true colors:
```
if has('nvim') || has('termguicolors')
  set termguicolors
endif
```

### Installation

#### vim-plug ###
```lua
Plug 'challenger-deep-theme/challenger-deep-nvim'
```
#### vundle ###
```viml
Plugin 'challenger-deep-theme/challenger-deep-nvim'
>>>>>>> master
```

**vim-plug**
```lua
Plug 'challenger-deep-theme/challenger-deep-nvim'
```

### Usage

```lua
require('challenger_deep').setup({
  transparent = true, -- or false for default background
})
vim.cmd.colorscheme('challenger_deep')
```

### Lualine

```lua
require('lualine').setup({
  options = {
    theme = 'challenger_deep',
    section_separators = { left = '', right = '' },
  },
})
```


The scheme defines highlights for Treesitter, LSP diagnostics, GitSigns, Telescope,
indent-blankline, nvim-web-devicons, WhichKey, Notify, noice and nvim-cmp.

![Screenshot](https://challenger-deep-theme.github.io/images/screenshots/vim.png)

### True color

Add this snippet to enable 24-bit colors:
```vim
if has('nvim') || has('termguicolors')
  set termguicolors
endif
```

### Troubleshooting
=======

### Lualine Theme ###

Challenger Deep also supports [lualine.vim](https://github.com/nvim-lualine/lualine.nvim). To enable the colorscheme,
add the following lines to your `init.lua`:

```lua
require'lualine'.setup {
  options = {
    theme = 'challenger_deep',
    section_separators = { left = '', right = '' },
  }
}
```
>>>>>>> master

When using Vim in tmux with the Alacritty terminal, set `default-terminal` to
`xterm-256color` in your tmux config:
```text
set-option -g default-terminal "xterm-256color"
```
