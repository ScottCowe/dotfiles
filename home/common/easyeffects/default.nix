{ lib, config, ... }:

with lib; {
  options.easyeffects = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable easyeffects 
      '';
    };
  };

  config = mkIf config.easyeffects.enable {
    services.easyeffects.enable = true; 
  };
}
