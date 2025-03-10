return {
  "smoka7/hop.nvim",
  version = "*",
  config = function()
    local opts = { keys = "etovxqpdygfblzhckisuran", }
    local hop = require("hop")
    hop.setup(opts)
    local directions = require("hop.hint").HintDirection
    local keymap = vim.keymap
    keymap.set("n", "<leader>hC", function() hop.hint_char1({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to chars(before cursor)" })
    keymap.set("n", "<leader>hc", function() hop.hint_char1({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to chars(after cursor)" })
    keymap.set("n", "<leader>hW", function() hop.hint_words({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to words(before cursor)" })
    keymap.set("n", "<leader>hw", function() hop.hint_words({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to words(after cursor)" })
    keymap.set("n", "<leader>hP", function() hop.hint_patterns({direction = directions.BEFORE_CURSOR}) end, { desc = "Jump to pattern(before cursor)" })
    keymap.set("n", "<leader>hp", function() hop.hint_patterns({direction = directions.AFTER_CURSOR}) end, { desc = "Jump to pattern(after cursor)" })
  end,
}
