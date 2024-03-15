{ config, lib, pkgs, inputs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  
  time.timeZone = "Europe/Edinburgh";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "JetBrainsMono";
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

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    jetbrains-mono
  ];
  
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

  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome3.gvfs; 
  };

  system.stateVersion = "23.11";
}

