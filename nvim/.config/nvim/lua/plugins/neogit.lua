---@type LazySpec
return {
  {
    "NeogitOrg/neogit",
    opts = function(_, opts)
      opts.kind = "auto"
      return opts
    end,
  },
}
