---@type LazySpec
return {
  {
    "catppuccin",
    opts = function(_, opts)
      opts.flavour = "macchiato"
      return opts
    end,
  },
}
