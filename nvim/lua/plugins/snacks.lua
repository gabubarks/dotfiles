---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local Snacks = require("snacks")
        local maps = opts.mappings
        maps.n["<Leader>bd"] = {
          function() Snacks.bufdelete() end,
          desc = "Close buffer",
        }
        maps.n["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        }
      end,
    }
  }
}
