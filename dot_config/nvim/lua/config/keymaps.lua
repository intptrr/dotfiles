local map = vim.keymap.set

-- common windows-style shortcuts
map("v", "<C-c>", '"+y', { desc = "Copy selection to clipboard" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
