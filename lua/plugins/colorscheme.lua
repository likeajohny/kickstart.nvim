return {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  priority = 1000,
  config = function()
    -- Match Ghostty: Dark Hard / Light Hard -> hard contrast for both.
    -- gruvbox.nvim reads vim.o.background to pick the light/dark palette;
    -- Neovim auto-detects the terminal's light/dark (OSC 11). Re-apply on any
    -- runtime switch.
    local function apply()
      require('gruvbox').setup { contrast = 'hard' }
      vim.cmd 'colorscheme gruvbox'
    end
    apply()
    vim.api.nvim_create_autocmd('OptionSet', { pattern = 'background', callback = apply })
  end,
}

-- Previous colorscheme, kept for easy switch-back:
--return {
--  'sainnhe/everforest',
--  name = 'everforest',
--  priority = 1000,
--  config = function()
--    vim.g.everforest_enable_italic = true
--    vim.g.everforest_better_performance = 1
--
--    -- Match Ghostty: Dark -> Hard, Light -> Medium. Neovim auto-detects the
--    -- terminal's light/dark (OSC 11); re-apply on any runtime switch.
--    local function apply()
--      vim.g.everforest_background = vim.o.background == 'light' and 'medium' or 'hard'
--      vim.cmd 'colorscheme everforest'
--    end
--    apply()
--    vim.api.nvim_create_autocmd('OptionSet', { pattern = 'background', callback = apply })
--  end,
--}

-- Previous colorscheme, kept for easy switch-back:
--return {
--  'rose-pine/neovim',
--  name = 'rose-pine',
--  priority = 1000,
--  opts = {
--    variant = 'auto',
--    dark_variant = 'moon',
--  },
--  config = function(_, opts)
--    require('rose-pine').setup(opts)
--    vim.cmd 'colorscheme rose-pine'
--  end,
--}

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
