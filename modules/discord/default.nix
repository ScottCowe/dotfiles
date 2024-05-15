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

    home.file.".config/Vencord/settings/quickCss.css".text = ''
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css");
    '';
  };
}
