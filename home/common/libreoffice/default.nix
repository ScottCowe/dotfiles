{ lib, config, pkgs, ... }:

with lib; {
  options.common.libreoffice = {
    enable = mkEnableOption "libreoffice";
  };

  config = mkIf config.common.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
