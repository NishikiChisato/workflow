vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- basical keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split winfow horizontally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>sL", ":vertical resize -2<CR>", { desc = "Expand split to left" })
keymap.set("n", "<leader>sH", ":vertical resize +2<CR>", { desc = "Expand split to right" })
keymap.set("n", "<leader>sJ", ":resize -2<CR>", { desc = "Expand split to top" })
keymap.set("n", "<leader>sK", ":resize +2<CR>", { desc = "Expand split to bottom" })

keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go left" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go right" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go down" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go up" })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "gt", { desc = "Goto next tab" })
keymap.set("n", "<leader>tp", "gT", { desc = "Goto previous tab" })
keymap.set("n", "<leader>tb", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- plugins keymaps

-- NvimTree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer to the current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })


-- telescope for fuzzy search
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todo comments" })

-- auto-session for worksapce save and restore
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save current session(workspace)" })
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore last session(workspace)" })

-- the keymap of todo-comment plugin is written in `todo-comments.lua`
-- this plugin only has two keymaps:
-- "]t" to jump to next todo comment
-- "[t" to jump to prev todo comment

-- the keymap of lsp and trouble diagnostics are written in `lspconfig.lua` and `trouble.lua`

-- the keymap of gitsigns is written in `gitsigns.lua`
