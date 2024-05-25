{ lib, config, ... }:

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
  };
}
