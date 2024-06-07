{ lib, config, pkgs, ... }:

with lib; {
  options.common.quickemu = {
    enable = mkEnableOption "quickemu";
  };

  config = mkIf config.common.quickemu.enable {
    home.packages = with pkgs; [
      quickemu
    ];
  };
}
