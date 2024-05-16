{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.wlogout;
in {
  options.modules.wlogout = { enable = mkEnableOption "wlogout"; };
  config = mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
    };
  };
}
