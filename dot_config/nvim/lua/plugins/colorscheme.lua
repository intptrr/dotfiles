return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Load this immediately on startup
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      -- Optional: Ensure your terminal background remains transparent 
      -- if you configured background-opacity in Ghostty
      require("tokyonight").setup({ transparent = true })

      -- Set the variant
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
