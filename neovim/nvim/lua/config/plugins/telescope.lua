return {
  --[=[
  this plugin is used to quick find file or string in current path
  --]=]

  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "absolute" },
        vimgrep_arguements = { "fdfind", "--type", "f", "--hidden", "--follow" },
        mappings = {
          -- insert mode key mapping
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      picker = {
        find_files = {
          hidden = true,
          find_command = { "fdfind", "--type", "f", "--hidden", "--follow" }
        },
      },
    })

    telescope.load_extension("fzf")

  end,
}
