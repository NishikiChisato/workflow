return {}
-- return {
--   "CopilotC-Nvim/CopilotChat.nvim",
--   dependencies = {
--     { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
--     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
--   },
--   build = "make tiktoken", -- Only on MacOS or Linux
--   opts = {
--     -- See Configuration section for options
--     mappings = {
--       complete = {
--         normal = '<C-f>',
--         insert = '<C-f>',
--       },
--       reset = {
--         normal = '<C-b>',
--         insert = '<C-b>',
--       },
--     }
--   },
--   -- See Commands section for default commands if you want to lazy load on them
--   config = function(_, opts)
--     local chat = require("CopilotChat")
--     chat.setup(opts)
--     local select = require("CopilotChat.select")
--     -- selection chat
--     vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
--       chat.ask(args.args, {selection = select.vasual})
--     end, {nargs = "*", range = true})
--
--     -- inline chat
--     vim.api.nvim_create_user_command("CopilotChatInline", function(args)
--       chat.ask(args.args, {
--         selection = select.visual,
--         window = {
--           layout = "float",
--           relative = "cursor",
--           width = 0.8,
--           height = 0.4,
--           row = 1,
--         }
--       })
--     end, {nargs = "*", range = true})
--   end,
--   event = "VeryLazy",
--   keys = {
--     -- show prompts actions with telescope
--     {
--       "<leader>ap",
--       function()
--         local actions = require("CopilotChat.actions")
--         require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
--       end,
--       desc = "CopilotChat -- Prompt actions",
--     },
--     {
--       "<leader>ap",
--       ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').vasual}))<CR>",
--       mode = "x",
--       desc = "CopilotChat - promop actions"
--     },
--     -- code related commands
--     { "<leader>ae", "<cmd>CopilotChatExplain<CR>", desc = "CopilotChat - Explain code" },
--     { "<leader>at", "<cmd>CopilotChatTests<CR>", desc = "CopilotChat - Generate tests" },
--     { "<leader>ar", "<cmd>CopilotChatReview<CR>", desc = "CopilotChat - Review code" },
--     { "<leader>aR", "<cmd>CopilotChatRefactor<CR>", desc = "CopilotChat - Refactor code" },
--     { "<leader>an", "<cmd>CopilotChatBetterNamings<CR>", desc = "CopilotChat - Better Naming" },
--     {
--       "<leader>av",
--       ":CopilotChatVisual<CR>",
--       mode = "x",
--       desc = "CopilotChat - Open in vertical split",
--     },
--     {
--       "<leader>ax",
--       ":CopilotChatInline<CR>",
--       mode = "x",
--       desc = "CopilotChat - Inline chat",
--     },
--   },
-- }
