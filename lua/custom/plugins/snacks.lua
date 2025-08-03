return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@type snacks.Config
  opts = {
    dim = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    animate = { enabled = true },
    bigfile = { enabled = true },
    terminal = { enabled = true },
    dashboard = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    zen = { enabled = false },
    statuscolumn = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 250 },
        easing = 'linear',
      },
      spamming = 10, -- threshold for spamming detection
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
      end,
    },
    words = { enabled = true },
    picker = {
      enabled = true,
      -- Replace vim.ui.select with Snacks picker
      ui_select = true,
    },
  },
  keys = {
    -- File and buffer navigation
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
    { '<leader>ss', function() Snacks.picker() end, desc = '[S]earch [S]elect Picker' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
    { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files' },
    { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
    
    -- Search in current buffer
    { '<leader>/', function() 
      Snacks.picker.lines({ 
        win = { 
          input = { relative = 'cursor' },
          height = 0.4,
        } 
      }) 
    end, desc = '[/] Fuzzily search in current buffer' },
    
    -- Search in open files
    { '<leader>s/', function() 
      Snacks.picker.grep({ 
        cwd = vim.fn.getcwd(),
        grep_open_files = true,
        prompt = 'Live Grep in Open Files',
      }) 
    end, desc = '[S]earch [/] in Open Files' },
    
    -- Search Neovim config files
    { '<leader>sn', function() 
      Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) 
    end, desc = '[S]earch [N]eovim files' },
  },
}
