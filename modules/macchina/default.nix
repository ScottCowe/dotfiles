{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.macchina;
in {
  options.modules.macchina = { enable = mkEnableOption "macchina"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ macchina ];

    home.file.".config/macchina/macchina.toml".source = ./macchina.toml;
    home.file.".config/macchina/themes".source = ./themes;
  };
}
