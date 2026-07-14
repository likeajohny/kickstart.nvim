return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  opts = {
    -- 'auto' follows `vim.o.background` (which Neovim auto-detects from the
    -- terminal): dark -> dark_variant, light -> dawn.
    variant = 'auto',
    dark_variant = 'moon',
  },
  config = function(_, opts)
    require('rose-pine').setup(opts)
    vim.cmd 'colorscheme rose-pine'
  end,
}

-- Previous colorscheme, kept for easy switch-back:
--return {
--  'rebelot/kanagawa.nvim',
--  name = 'kanagawa',
--  priority = 1000,
--  opts = {
--    background = {
--      dark = 'wave', -- swap to 'dragon' for the darker dark variant
--      light = 'lotus',
--    },
--  },
--  config = function(_, opts)
--    require('kanagawa').setup(opts)
--    vim.cmd 'colorscheme kanagawa'
--  end,
--}

--return {
--  'catppuccin/nvim',
--  name = 'catpuccin',
--  priority = 1000,
--  opts = {
--    flavour = 'auto',
--    background = { -- :h background
--      light = 'latte',
--      dark = 'mocha',
--    },
--  },
--  config = function()
--    vim.cmd.colorscheme 'catppuccin'
--  end,
-- }

--return {
--  'embark-theme/vim',
--  priority = 1000,
--  config = function()
--    vim.cmd.colorscheme 'embark'
--  end,
--}

--return {
--  'olimorris/onedarkpro.nvim',
--  priority = 1000,
--  config = function()
--    if vim.o.background == 'dark' then
--      vim.cmd.colorscheme 'onedark'
--    else
--      vim.cmd.colorscheme 'onelight'
--    end
--  end,
--}
