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
        ripgrep
        lua-language-server
        nixd
      ];

      plugins = with pkgs.vimPlugins; [
        lualine-nvim
        nvim-web-devicons
        
        comment-nvim

        telescope-fzf-native-nvim
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }

        {
          plugin = catppuccin-nvim;
          config = "colorscheme catppuccin-mocha";
        }

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugin/lsp.lua;
        }

        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugin/cmp.lua;
        }

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-lua
          ]));
          config = toLuaFile ./plugin/treesitter.lua;
        }

        luasnip
        friendly-snippets

        cmp_luasnip
        cmp-nvim-lsp

        neodev-nvim

        gitsigns-nvim
      ];

      extraLuaConfig = ''
      	${builtins.readFile ./options.lua}

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        require("lualine").setup({
          icons_enabled = true,
          theme = 'auto',
        })

        require("Comment").setup()
        
        require("gitsigns").setup()
      '';
    };
  };
}
