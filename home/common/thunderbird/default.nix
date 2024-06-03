{ lib, config, pkgs, ... }:

with lib; {
  options.common.thunderbird = {
    enable = mkEnableOption "thunderbird";
  };

  config = mkIf config.common.thunderbird.enable {
    home.packages = with pkgs; [
      thunderbird
    ];
  };
}
