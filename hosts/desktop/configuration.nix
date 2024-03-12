{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  networking.hostName = "unicorn"; 
  
  time.timeZone = "Europe/Edinburgh";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  programs.thunar.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.cowe = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "cowe" = import ./home.nix;
    };
  };

  programs.ssh.startAgent = true;

  programs.ssh.extraConfig = ''
     Host *
     AddKeysToAgent yes
  '';

  system.stateVersion = "23.11";
}

