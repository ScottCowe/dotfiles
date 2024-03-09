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

  networking.hostName = "thistle"; 
  #networking.wireless.enable = true;
  #networking.wireless.userControlled.enable = true;
  networking.networkmanager.enable = true;

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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim 
    git
    alacritty
    rofi
    mako 
  ];

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

  services.openssh = {
    enable = true;
    hostKeys = [
      {
	path = "/etc/ssh/gitlab";
	type = "ed25519";
      }
      {
	path = "/etc/ssh/github";
	type = "ed25519";
      }
    ];
  };

  programs.ssh.startAgent = true;

  programs.ssh.extraConfig = ''
     Host *
     AddKeysToAgent yes
  '';

  system.stateVersion = "23.11";
}

