#!/bin/bash

PATH=$(pwd)
PATH_LITE="$PATH/lite_nvim"
PATH_CONFIG="$PATH/lite_nvim/lua/config"
PATH_CORE="$PATH/lite_nvim/lua/config/core"
PATH_PLUGINS="$PATH/lite_nvim/lua/config/plugins"

if [ ! -d $PATH_LITE ]; then
  /usr/bin/mkdir -p $PATH_LITE
fi

if [ ! -d $PATH_CORE ]; then
  /usr/bin/mkdir -p $PATH_CORE
fi

if [ ! -d $PATH_PLUGINS ]; then
  /usr/bin/mkdir -p $PATH_PLUGINS
fi

/usr/bin/cp "$PATH/neovim/nvim/lua/config/core/init.lua" "$PATH_CORE/init.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/core/keymaps.lua" "$PATH_CORE/keymaps.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/core/options.lua" "$PATH_CORE/options.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/lazy.lua" $PATH_CONFIG

/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/init.lua" "$PATH_PLUGINS/init.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/alpha.lua" "$PATH_PLUGINS/alpha.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/auto-session.lua" "$PATH_PLUGINS/auto-session.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/bufferline.lua" "$PATH_PLUGINS/bufferline.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/colorscheme.lua" "$PATH_PLUGINS/colorscheme.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/dressing.lua" "$PATH_PLUGINS/dressing.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/indent-blankline.lua" "$PATH_PLUGINS/indent-blankline.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/lualine.lua" "$PATH_PLUGINS/lualine.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/nvim-tree.lua" "$PATH_PLUGINS/nvim-tree.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/substitute.lua" "$PATH_PLUGINS/substitute.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/telescope.lua" "$PATH_PLUGINS/telescope.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/vim-maximizer.lua" "$PATH_PLUGINS/vim-maximizer.lua"
/usr/bin/cp "$PATH/neovim/nvim/lua/config/plugins/which-key.lua" "$PATH_PLUGINS/which-key.lua"
