return {
  "jmacadie/telescope-hierarchy.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    { -- lazy style key map
      -- Choose your own keys, this works for me
      "<leader>fi",
      "<cmd>Telescope hierarchy incoming_calls<cr>",
      desc = "LSP: [F]ind [I]ncoming Calls",
    },
    {
      "<leader>fo",
      "<cmd>Telescope hierarchy outgoing_calls<cr>",
      desc = "LSP: [F]ind [O]utgoing Calls",
    },
  },
  opts = {
    -- don't use `defaults = { }` here, do this in the main telescope spec
    extensions = {
      hierarchy = {
        mappints = {
          i = {
            ["<esc>"] = require("telescope.actions").close,                    -- close
            ["<C-k>"] = require("telescope.actions").move_selection_previous,  -- move to prev result
            ["<C-j>"] = require("telescope.actions").move_selection_next,      -- move to next result
          },
          n = {
            ["<esc>"] = require("telescope.actions").close,                    -- close
            ["k"] = require("telescope.actions").move_selection_previous,  -- move to prev result
            ["j"] = require("telescope.actions").move_selection_next,      -- move to next result
          }
        },
        layout_strategy = "horizontal",
      },
      -- no other extensions here, they can have their own spec too
    },
  },
  config = function(_, opts)
    -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
    -- configs for us. We won't use data, as everything is in it's own namespace (telescope
    -- defaults, as well as each extension).
    require("telescope").setup(opts)
    require("telescope").load_extension("hierarchy")
  end,
}
