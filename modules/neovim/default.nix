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

      plugins = with pkgs.vimPlugins; [
        lualine-nvim
        nvim-web-devicons

        telescope-fzf-native-nvim
				{
					plugin = telescope-nvim;
					config = toLuaFile ./plugin/telescope.lua;
				}
      ];

      extraLuaConfig = ''
        vim.g.mapleader = ' '
        vim.g.maplocalleader = ' '

        vim.o.clipboard = 'unnamedplus'

        vim.o.number = true
        vim.o.relativenumber = true

				vim.o.tabstop = 2
				vim.o.shiftwidth = 2
				vim.o.expandtab = true

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      '';
    };
  };
}
