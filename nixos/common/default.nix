{ lib, config, pkgs, ... }:

with lib; {
  options.common = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable common stuff 
      '';
    };
  };

  config = mkIf config.common.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

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

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };

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
  };
}
