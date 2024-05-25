{ config, pkgs, ... }:

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

    nvidia = {
      enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "535.154.05";
        sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
        sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
        openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
        settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
        persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
      };
    };

    wooting.enable = true;
  };
}
