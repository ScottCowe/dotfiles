{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.neovim;
  
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  options.modules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
      ];

      plugins = with pkgs.vimPlugins; [
        lualine-nvim
        nvim-web-devicons

        telescope-fzf-native-nvim
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }

        {
          plugin = catppuccin-nvim;
          config = "colorscheme catppuccin-mocha";
        }

        comment-nvim

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugin/lsp.lua;
        }

        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugin/cmp.lua;
        }

        luasnip

        cmp_luasnip
        cmp-nvim-lsp
      ];

      extraLuaConfig = ''
      	${builtins.readFile ./options.lua}

        require("lualine").setup({
          icons_enabled = true,
          theme = 'auto',
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        require("Comment").setup()
      '';
    };
  };
}
