return {
  "smoka7/hop.nvim",
  version = "*",
  config = function()
    local opts = { keys = "etovxqpdygfblzhckisuran", }
    local hop = require("hop")
    hop.setup(opts)
    -- local directions = require("hop.hint").HintDirection
    local keymap = vim.keymap
    keymap.set("n", "<leader>jc", function() hop.hint_char1() end, { desc = "Jump to chars(after cursor)" })
    keymap.set("n", "<leader>jw", function() hop.hint_words() end, { desc = "Jump to words(after cursor)" })
    keymap.set("n", "<leader>jp", function() hop.hint_patterns() end, { desc = "Jump to pattern(after cursor)" })
  end,
}
