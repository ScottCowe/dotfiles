{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      wl-clipboard
      grim slurp
      mako
    ]; 

    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, M, exit"
        "$mod, Return, exec, wezterm"
        "$mod SHIFT, Q, killactive"
        "$mod, E, exec, thunar"
        "$mod, D, exec, rofi -show drun"
        "$mod, F, fullscreen"
        ''$mod, S, exec, grim -g "$(slurp -w 0)" - | wl-copy --type image/png'' 

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        "$mod, left, resizeactive, -50 0"
        "$mod, right, resizeactive, 50 0"
        "$mod, up, resizeactive, 0 -50"
        "$mod, down, resizeactive, 0 50"
      ]      
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(89b4faee)"; # Catppuccin Mocha Blue
        "col.inactive_border" = "rgba(00000000)";
      };

      decoration = {
        rounding = 0;

        blur.enabled = false;
        drop_shadow = false;
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "windows, 1, 7, default, popin 80%"
          "workspaces, 1, 6, default, slide"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
    };
  };
}
