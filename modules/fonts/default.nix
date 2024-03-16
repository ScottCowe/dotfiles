{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.fonts;
in {
  options.modules.fonts = { enable = mkEnableOption "fonts"; };
  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ]; 
  };
}
