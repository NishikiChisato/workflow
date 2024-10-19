return {
  --[=[
  this plugin is used to maximize or minimize all split window
  --]=]

  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/Minimize split window" },
  },
}
