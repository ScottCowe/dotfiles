{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.idea;
in {
  options.modules.idea = { enable = mkEnableOption "idea"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.idea-community
    ]
  };
}
