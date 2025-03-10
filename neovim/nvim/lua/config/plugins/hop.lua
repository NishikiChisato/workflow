return {
  "smoka7/hop.nvim",
  version = "*",
  config = function()
    local opts = { keys = "etovxqpdygfblzhckisuran", }
    local hop = require("hop")
    hop.setup(opts)
    local directions = require("hop.hint").HintDirection
    local keymap = vim.keymap
    keymap.set("n", "<leader>jC", function() hop.hint_char1({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to chars(before cursor)" })
    keymap.set("n", "<leader>jc", function() hop.hint_char1({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to chars(after cursor)" })
    keymap.set("n", "<leader>jW", function() hop.hint_words({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to words(before cursor)" })
    keymap.set("n", "<leader>jw", function() hop.hint_words({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to words(after cursor)" })
    keymap.set("n", "<leader>jP", function() hop.hint_patterns({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to pattern(before cursor)" })
    keymap.set("n", "<leader>jp", function() hop.hint_patterns({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to pattern(after cursor)" })
  end,
}
