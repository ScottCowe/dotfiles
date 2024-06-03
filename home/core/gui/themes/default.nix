{ lib, config, pkgs, inputs, ... }:

with lib; {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  options.gui.themes = {
    enable = mkEnableOption "themes";
  };

  config = mkIf config.gui.themes.enable {
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

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
