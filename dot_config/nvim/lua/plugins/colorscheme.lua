return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- Optional: Ensure your terminal background remains transparent
      -- if you configured background-opacity in Ghostty
      transparent = true,
      -- Set the variant
      style = "night",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
