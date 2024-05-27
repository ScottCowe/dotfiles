{ lib, config, ... }:

with lib; {
  options.hamachi = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable hamachi 
      '';
    };
  };

  config = mkIf config.hamachi.enable {
    services.logmein-hamachi.enable = true;
  };
}
