{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.prismlauncher;
in {
  options.modules.prismlauncher = { enable = mkEnableOption "prismlauncher"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
