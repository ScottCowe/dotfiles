{ pkgs, lib, config, ... }:

with lib; {
  options.gaming.lutris = { 
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable lutris 
      '';
    };
  };

  config = mkIf config.gaming.lutris.enable {
    home.packages = with pkgs; [
      (lutris.override {})

      # Games
      vintagestory
    ];
  };
}
