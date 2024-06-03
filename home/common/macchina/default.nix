{ lib, config, pkgs, ... }:

with lib; {
  options.common.macchina = { 
    enable = mkEnableOption "macchina"; 
  };

  config = mkIf config.common.macchina.enable {
    home.packages = with pkgs; [ macchina ];

    home.file.".config/macchina/macchina.toml".source = ./macchina.toml;
    home.file.".config/macchina/themes".source = ./themes;
  };
}
