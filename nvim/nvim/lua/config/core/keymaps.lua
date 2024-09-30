vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- basical keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go left" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go right" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go down" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go up" })

keymap.set("n", "<leader>wH", ":vertical resize -2<CR>", { desc = "Expand to left" })
keymap.set("n", "<leader>wL", ":vertical resize +2<CR>", { desc = "Expand to right" })
keymap.set("n", "<leader>wJ", ":resize -2<CR>", { desc = "Expand up" })
keymap.set("n", "<leader>wK", ":resize +2<CR>", { desc = "Expand down" })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "gt", { desc = "Goto next tab" })
keymap.set("n", "<leader>tp", "gT", { desc = "Goto previous tab" })
keymap.set("n", "<leader>tb", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- plugins keymaps
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer to the current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

