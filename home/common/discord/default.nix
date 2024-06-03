{ lib, config, pkgs, ... }:

with lib; {
  options.common.discord = { 
    enable = mkEnableOption "discord"; 
  };

  config = mkIf config.common.discord.enable {
    nixpkgs.config.allowUnfree = true; 
    home.packages = with pkgs; [
      (discord.override {
        withOpenASAR = false;
        withVencord = true;
      })
    ];

    home.file.".config/Vencord/settings/quickCss.css".text = ''
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css");
    '';
  };
}
