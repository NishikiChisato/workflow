return {
  --[=[
  this plugin is used to provide keymaps hints
  --]=]

  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- configuration comes here or leave it empty to use default settings

  },
}
