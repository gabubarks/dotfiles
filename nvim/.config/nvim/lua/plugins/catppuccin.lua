---@type LazySpec
return {
  {
    "catppuccin",
    lazy = true,
    opts = function(_, opts)
      -- Set flavor
      opts.flavour = "macchiato"

      -- Use undercurl, defaults to underline otherwise
      opts.integrations = vim.tbl_deep_extend(
        "force",
        opts.integrations,
        {
          native_lsp = {
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
              ok = { "undercurl" },
            },
          },
        }
      )

      return opts
    end,
  },
}
