{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.wezterm;
in {
  options.modules.wezterm = { enable = mkEnableOption "wezterm"; };
  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      extraConfig = builtins.readFile ./wezterm.lua;
    };
  };
}
