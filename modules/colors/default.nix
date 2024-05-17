{ pkgs, lib, config, inputs, ... }:

with lib;
let
  cfg = config.modules.colors;
in {
  options.modules.colors = { enable = mkEnableOption "colors"; };
  config = mkIf cfg.enable {
    colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha; 

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
