-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.editing-support.suda-vim" },
  -- import/override with your plugins folder
}
