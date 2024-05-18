{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.kitty;
in {
  options.modules.kitty = { enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      theme = "Catppuccin-Mocha";
      font =  {
        name = "FiraCode Nerd Font";
        package = pkgs.fira-code;
        size = 12;
      };

      settings = {
        clear_all_shortcuts = true;
      };

      keybindings = {
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste";
        "alt+enter" = "new_tab";
        "alt+q" = "close_tab";
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
        "alt+0" = "goto_tab 10";
      };
    };
  };
}
