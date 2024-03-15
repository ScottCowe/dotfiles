{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.discord;
in {
  options.modules.discord = { enable = mkEnableOption "discord"; };
  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true; 
    home.packages = with pkgs; [
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
    ];
  };
}
