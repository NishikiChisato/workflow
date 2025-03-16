return {
  -- amongst your other plugins
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
    })
    local keymap = vim.keymap
    keymap.set("n", [[<leader><c-\>]], ":ToggleTerm<CR>", { desc = "Opan terminal" })
    keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = "Close terminal" })
  end,
}
