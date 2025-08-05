return {
  "monaqa/dial.nvim",
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
        augend.semver.alias.semver,
        augend.constant.new{
          elements = {"and", "or"},
          word = true,
          cyclic = true,
        },
        augend.constant.new{
          elements = {"&&", "||"},
          word = false,
          cyclic = true,
        },
      },
    }
  end,
  keys = {
    { "<C-a>", function() require("dial.map").inc_normal() end, mode = "n" },
    { "<C-x>", function() require("dial.map").dec_normal() end, mode = "n" },
    { "<C-a>", function() require("dial.map").inc_visual() end, mode = "v" },
    { "<C-x>", function() require("dial.map").dec_visual() end, mode = "v" },
    { "g<C-a>", function() require("dial.map").inc_gvisual() end, mode = "v" },
    { "g<C-x>", function() require("dial.map").dec_gvisual() end, mode = "v" },
  },
}