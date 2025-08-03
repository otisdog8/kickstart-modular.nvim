return {
  'andrewferrier/debugprint.nvim',
  dependencies = {
    'echasnovski/mini.nvim', -- Needed for line highlighting
    'folke/snacks.nvim', -- For :Debugprint search command
  },
  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = '*', -- Use stable version
  config = function()
    require('debugprint').setup()
  end,
}