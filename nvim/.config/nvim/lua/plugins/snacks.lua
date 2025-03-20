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
        if maps ~= nil then
          -- Use snacks for buffer delete. Remap old binding to bD
          maps.n["<Leader>bD"] = maps.n["<Leader>bd"]
          maps.n["<Leader>bd"] = {
            function() Snacks.bufdelete() end,
            desc = "Close buffer",
          }
        end
      end,
    }
  }
}
