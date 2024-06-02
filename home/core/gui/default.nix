{ lib, config, ... }:

with lib; {
  imports = [
    ./hyprland
    ./mako
    ./rofi
    ./kitty
    ./waybar
    ./wlogout
  ];

  options.gui = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable gui 
      '';
    };
  };

  config = mkIf config.gui.enable {
    gui = {
      hyprland.enable = true;
      mako.enable = true;
      rofi.enable = true;
      kitty.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
    };
  };
}
