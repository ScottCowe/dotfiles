{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      #./hardware-configuration.nix
      #inputs.home-manager.nixosModules.default
    ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  #networking.hostName = "unicorn"; 
  
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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.shells = with pkgs; [ zsh ];

  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
		MOZ_ENABLE_WAYLAND = "1";
	};

	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};

	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.production;
	};

  users.users.cowe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  #home-manager = {
  #  extraSpecialArgs = { inherit inputs; };
  #  users = {
  #    "cowe" = import ./home.nix;
  #  };
  #};

  programs.ssh.startAgent = true;

  programs.ssh.extraConfig = ''
     Host *
     AddKeysToAgent yes
  '';

  services.gvfs.enable = true;

  system.stateVersion = "23.11";
}

