{ lib, config, inputs, pkgs, ... }:

with lib; {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  options.gui.ags = {
    enable = mkEnableOption "ags";
  }; 

  config = mkIf config.gui.ags.enable {
    programs.ags = {
      enable = true;
      
      configDir = ../ags;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };
}
