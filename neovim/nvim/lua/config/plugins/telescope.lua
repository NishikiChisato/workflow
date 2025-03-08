------------------------------------------- path display -----------------------------------

local function normalize_path(path)
  return path:gsub("\\", "/")
end

local function normalize_cwd()
  return normalize_path(vim.loop.cwd() .. "/")
end

-- prefix equal is subdirectory
local function is_subdirectory(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
  local normalized_path = normalize_path(path)
  local normalized_cwd = normalize_cwd()
  local filename = normalized_path:match("[^/]+$")

  if is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

local function path_display(_, path)
  local stripped_path, filename = split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s ~ %s", filename, stripped_path)
end

------------------------------------------- path display -----------------------------------

return {
  --[=[
  this plugin is used to quick find file or string in current path
  --]=]

  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    -- file and text search in hidden files and directories
    local telescope_config = require("telescope.config")
    -- clone the default telescope configuration file
    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
    -- search in hidden/dot file
    table.insert(vimgrep_arguments, "--hidden")
    -- don't search in .git directory
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")
    table.insert(vimgrep_arguments, "--trim")

    telescope.setup({
      defaults = {
        path_display = path_display,
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          -- insert mode key mapping
          i = {
            ["<esc>"] = actions.close,                    -- close
            ["<M-p>"] = action_layout.toggle_preview,     -- toogle preview
            ["<C-k>"] = actions.move_selection_previous,  -- move to prev result
            ["<C-j>"] = actions.move_selection_next,      -- move to next result
            ["<C-n>"] = actions.cycle_previewers_next,    -- cycle preview for git commit
            ["<C-p>"] = actions.cycle_previewers_prev,
          },
          n = {
            ["<M-p>"] = action_layout.toggle_preview,     -- toogle preview
          }
        },
        preview = {
          -- ignore big file bigger than a threshold
          filesize_limit = 0.1, -- MB
        },
        ------------------- maximize width and height of telescope -------------------
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",
        ------------------- maximize width and height of telescope -------------------
      },
      picker = {
        find_files = {
          hidden = true,
          find_command = { "fdfind", "--type", "f", "--strip-cmd-prefix", "--hidden", "--follow", "--glob", "!**/.git/*" },
          mappings = {
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                -- :p -> get the full name of this file
                -- :h -> get the head name of this file
                -- :p:h -> will get the file path of this file
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                actions.close(prompt_bufnr)
                vim.cmd(string.format("silent lcd %s", dir))
              end,
            }
          }
        },
      },
    })

    ------------------------------------------------------ keymaps ----------------------------------------------------------

    local keymap = vim.keymap
    local telescope_builtin = require("telescope.builtin")

    keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", telescope_builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", telescope_builtin.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", telescope_builtin.grep_string, { desc = "Find string under cursor in cwd" })

    -- fallback to find_files if git_files can't find .git directory
      -- cache the result of "git rev-parse"
    local is_inside_work_tree = {}
    function _G.Project_Files()
      local opts = {}
      local cwd = vim.fn.getcwd()
      if not is_inside_work_tree[cwd] then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end
      if is_inside_work_tree[cwd] then
        telescope_builtin.git_files(opts)
      else
        telescope_builtin.find_files(opts)
      end
    end
    keymap.set("n", "<leader>fg", "<CMD>lua Project_Files()<CR>")

    ------------------------------------------------------ keymaps ----------------------------------------------------------



    ------------------------------- hide statusline and tabline to let telescope full screen ---------------------------------
    local temp_showtabline
    local temp_laststatus
    function _G.global_telescope_find_pre()
      temp_showtabline = vim.o.showtabline
      temp_laststatus = vim.o.laststatus
      vim.o.showtabline = 0
      vim.o.laststatus = 0
    end

    function _G.global_telescope_leave_prompt()
      vim.o.laststatus = temp_laststatus
      vim.o.showtabline = temp_showtabline
    end

    vim.cmd([[
      augroup MyAutocmds
      autocmd!
      autocmd User TelescopeFindPre lua global_telescope_find_pre()
      autocmd FileType TelescopePrompt autocmd BufLeave <buffer> lua global_telescope_leave_prompt()
      augroup END
    ]])

    ------------------------------- hide statusline and tabline to let telescope full screen ---------------------------------

    telescope.load_extension("fzf")

  end,
}
