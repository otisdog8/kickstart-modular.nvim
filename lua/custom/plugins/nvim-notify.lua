return {
  'rcarriga/nvim-notify',
  opts = {
    -- Animation style
    stages = 'fade_in_slide_out',
    -- Default timeout for notifications
    timeout = 3000,
    -- For stages that change opacity this is treated as the highlight behind the window
    background_colour = '#000000',
    -- Icons for different log levels
    icons = {
      ERROR = '',
      WARN = '',
      INFO = '',
      DEBUG = '',
      TRACE = '✎',
    },
  },
}