{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.gtk;
in {
  options.modules.gtk = { enable = mkEnableOption "gtk"; };
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "blue" ];
          size = "standard";
          tweaks = [];
          variant = "mocha"; 
        };
      };
    };   
  };
}
