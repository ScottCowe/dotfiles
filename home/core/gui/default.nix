{ lib, config, ... }:

with lib; {
  imports = [

  ];

  options.gui = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable gui 
      '';
    };
  };

  config = mkIf config.gui.enable {

  };
}
