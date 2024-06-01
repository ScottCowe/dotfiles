{ lib, config, ... }:

with lib; {
  imports = [
    ./neovim
  ];

  options.dev = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable dev environment 
      '';
    };
  };

  config = mkIf config.dev.enable {
    dev = {
      neovim.enable = true;
    };
  };
}
