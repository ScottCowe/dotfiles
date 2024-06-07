{ pkgs, ... }:

{
  imports = [
    ../../home
  ];

  config = {
    gui.enable = true;
    dev.enable = true;
    gaming.enable = true;

    common = {
      easyeffects.enable = true;
      lf.enable = true;
      discord.enable = true;
      firefox.enable = true;
      gimp.enable = true;
      macchina.enable = true;
      bottom.enable = true;
      libreoffice.enable = true;
      thunderbird.enable = true;
      bat.enable = true;
      eza.enable = true;
      quickemu.enable = true;
    };

    gaming.prismlauncher.theme = pkgs.stdenv.mkDerivation {
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
