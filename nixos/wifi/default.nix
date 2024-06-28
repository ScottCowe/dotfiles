{ lib, config, ... }:

with lib; {
  options.wifi = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable networkmanager 
      '';
    };
  };

  config = mkIf config.wifi.enable {
    networking.networkmanager.enable = true; 
  };
}
