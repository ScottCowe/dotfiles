{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.waybar;
in {
  options.modules.waybar = { enable = mkEnableOption "waybar"; };
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          spacing = 7;
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            # music
          ];
          modules-right = [
            "tray"
            "pulseaudio"
            "network"
            "battery"
            "clock"
          ];
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
          };
          "tray" = {
            spacing = 10;
          };
          "clock" = {
            tooltip-format = "{:%A}";
            format = "{:%H:%M:%S  %d/%m/%y}";
          };
          "battery" = {
            states = {
              warning = "20";
            };
            format = "{icon}";
            format-icons = [
              "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
            ];
            format-charging = "󰂄";
            format-warning = "󰂃";
            tooltip-format = "{capacity}% capacity";
          };
          "network" = {
            format-wifi = "󰤨";
            format-disconnected = "󰤭";
            tooltip-format = "Connected to {essid}";
          };
          "pulseaudio" = {
            format = "{icon}";
            format-muted = "󰖁";        
				    format-icons = {
					    default = [
                "" "" "󰕾"
              ];
				    };
				    tooltip-format = "{volume}% volume";
          };
        };
      };

      style = with config.colorScheme.palette; ''
        @define-color base   #${base00};
        @define-color mantle #${base01};
        @define-color text     #${base05};
        @define-color surface0 #${base02};
        @define-color surface1 #${base03};
        @define-color surface2 #${base03};
        @define-color blue      #${base0D};
        @define-color lavender  #${base07};
        @define-color teal      #${base0C};
        @define-color green     #${base0B};
        @define-color yellow    #${base0A};
        @define-color red       #${base08};
        @define-color mauve     #${base0E};
        @define-color flamingo  #${base0F};
        @define-color rosewater #${base06};

        * {
          font-family: Cantarell, Symbols Nerd Font;
          font-weight: bolder;
          font-size: 14px;
        }

        /*window#waybar {
            background-color: @base;
            color: @text;
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }*/

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            box-shadow: inset 0 -3px transparent;
            /* Avoid rounded borders under each button name */
            border: none;
            border-radius: 0;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */

        #workspaces button:hover {
            color: @blue;
            box-shadow: inherit;
            text-shadow: inherit;
            background: @mantle;
            border: @mantle;
        }

        #workspaces button {
            padding: 0 5px;
            color: @surface2;
            margin: 4px 0 4px 6px;
            transition: color 200ms ease-in-out;
        }

        #workspaces button.selected {
            color: @text;
        }

        #workspaces button.active {
            color: @blue;
        }

        #workspaces button.urgent {
            color: @red;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
            padding: 0 9px;
            color: @text;
            border-radius: 15px;
            margin: 5px 0;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, reduce left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 2px;
        }

        #clock {
          color: @text;
        }

        #pulseaudio {
          color: @text;
        }

        #pulseaudio.muted {
          color: @red;
        }

        #network {
          color: @text;
        }

        #network.disconnected {
          color: @red;
        }

        #battery {
            color: @green;
        }

        #battery.warning:not(.charging) {
            color: @red;
        }
      '';
    };
  };
}
