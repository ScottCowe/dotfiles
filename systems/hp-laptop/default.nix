{ pkgs, ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
  ];

  config = {
    grub.theme = pkgs.stdenv.mkDerivation rec { 
      name = "catppuccin-mocha-grub-theme";
      
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "grub";
        rev = "88f6124";
        sha256 = "sha256-e8XFWebd/GyX44WQI06Cx6sOduCZc5z7/YhweVQGMGY=";
      };

      installPhase = ''
        mkdir -p $out
        cp -r src/${name}/* $out
      '';
    };
  };
}
