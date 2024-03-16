{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.thunar;
in {
  options.modules.thunar = { enable = mkEnableOption "thunar"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      xfce.thunar
      xfce.xfconf
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      gnome.gnome-themes-extra
      gnome3.gvfs
    ]; 
  };
}
