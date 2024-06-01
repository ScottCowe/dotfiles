{ pkgs, lib, config, ... }:

with lib; {
  options.gaming.prismlauncher = { 
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable prismlauncher 
      '';
    };
  };

  config = mkIf config.gaming.prismlauncher.enable {
    home.packages = with pkgs; [
      (prismlauncher.override {
        jdks = [ jdk21 jdk17 jdk8 ];
        additionalPrograms = [ alsa-oss ];
      })
    ];

    home.file.".local/share/PrismLauncher/themes/Catppuccin-Mocha".source = pkgs.stdenv.mkDerivation {
      name = "Catppuccin-Mocha-theme";

      src = pkgs.fetchurl {
        url = "https://github.com/PrismLauncher/Themes/releases/download/2024-04-01_1711994750/Catppuccin-Mocha-theme.zip";
        sha256 = "197xvd388ddag1qsv34rikff6hybddzyh26dam08q5hhmq11rbay";
      };

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out
        ${pkgs.unzip}/bin/unzip $src -d $out/
        mv $out/themes/Catppuccin-Mocha/* $out
        rm -rf $out/themes/
      '';
    };
  };
}
