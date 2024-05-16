{ config, lib, pkgs, inputs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;

      theme = pkgs.stdenv.mkDerivation rec { 
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
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.cowe = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    }; 
  }; 

  system.stateVersion = "23.11";
}
