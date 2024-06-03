{ lib, config, ... }:

with lib; {
  options.common.easyeffects = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable easyeffects 
      '';
    };
  };

  config = mkIf config.common.easyeffects.enable {
    services.easyeffects.enable = true; 
  };
}
