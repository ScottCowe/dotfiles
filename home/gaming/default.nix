{ lib, config, ... }:

with lib; {
  imports = [
    ./lutris
    ./prismlauncher
  ];

  options.gaming = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable gaming stuff 
      '';
    };
  };

  config = mkIf config.gaming.enable {
    gaming = {
      lutris.enable = true;
      prismlauncher.enable = true;
    };
  };
}
