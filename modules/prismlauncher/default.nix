{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.prismlauncher;
  catppuccin-mocha = import ./catppuccin-mocha.nix { inherit pkgs; };
in {
  options.modules.prismlauncher = { enable = mkEnableOption "prismlauncher"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (prismlauncher.override {
        jdks = [ jdk21 jdk17 jdk8 ];
        additionalPrograms = [ alsa-oss ];
      })
    ];

    home.file.".local/share/PrismLauncher/themes/Catppuccin-Mocha".source = catppuccin-mocha;
  };
}
