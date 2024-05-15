{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.mako;
in {
  options.modules.mako = { enable = mkEnableOption "mako"; };
  config = mkIf cfg.enable {
    services.mako = with config.colorScheme.palette; {
      enable = true;
      backgroundColor = "#${base01}";
      borderColor = "#${base0E}";
      borderRadius = 5;
      borderSize = 2;
      textColor = "#${base04}";
      layer = "overlay";
      defaultTimeout = 5000;
    };
  };
}
