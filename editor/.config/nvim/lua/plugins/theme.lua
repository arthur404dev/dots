return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  { "yamatsum/nvim-nonicons" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      term_colors = false,
      integrations = {
        blink_cmp = true,
        neotree = true,
      },
    },
  },
}
