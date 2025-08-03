return {
  'theHamsta/nvim-dap-virtual-text',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('nvim-dap-virtual-text').setup {
      enabled = true,                        -- enable this plugin (the default)
      enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle
      highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged
      highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables
      show_stop_reason = true,               -- show stop reason when stopped for exceptions
      commented = false,                     -- prefix virtual text with comment string
      only_first_definition = true,          -- only show virtual text at first definition
      all_references = false,                -- show virtual text on all references of the variable
      clear_on_continue = false,             -- clear virtual text on "continue"
      -- Position of virtual text, inline if nvim 0.10+, otherwise end of line
      virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
      -- Experimental features:
      all_frames = false,                    -- show virtual text for all stack frames
      virt_lines = false,                    -- show virtual lines instead of virtual text
      virt_text_win_col = nil               -- position the virtual text at a fixed window column
    }
  end,
}