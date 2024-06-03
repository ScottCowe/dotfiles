{ lib, config, pkgs, ... }:

with lib; {
  options.common.gimp = { 
    enable = mkEnableOption "gimp"; 
  };

  config = mkIf config.common.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
