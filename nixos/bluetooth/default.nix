{ lib, config, ... }:

with lib; {
  options.bluetooth = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable bluetooth 
      '';
    };
  };

  config = mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };
}
