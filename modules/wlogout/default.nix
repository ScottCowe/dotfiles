{ pkgs, lib, config, nix-colors, ... }:

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
          text = "";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "";
          keybind = "r";
        }
      ];

      style = with config.colorScheme.palette; ''
        * {
          background-image: none;
          box-shadow: none;
        }

        window {
          background-color: rgba(${nix-colors.lib.conversions.hexToRGBString ", " base00}, 0.5);
        }

        button {
          border-radius: 5;
          border-color: #${base0D};
          text-decoration-color: #FFFFFF;
          color: #FFFFFF;
          background-color: #${base00};
          border-style: solid;
          border-width: 1px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          margin: 140px 5px;
        }

        button:hover {
          background-color: #${base03};
          outline-style: none;
        }

        #lock {
          background-image: url("/home/cowe/.config/wlogout/icons/lock.png");
        }

        #logout {
          background-image: url("/home/cowe/.config/wlogout/icons/logout.png");
        }

        #suspend {
          background-image: url("/home/cowe/.config/wlogout/icons/suspend.png");
        }

        #hibernate {
          background-image: url("/home/cowe/.config/wlogout/icons/hibernate.png");
        }

        #shutdown {
          background-image: url("/home/cowe/.config/wlogout/icons/shutdown.png");
        }

        #reboot {
          background-image: url("/home/cowe/.config/wlogout/icons/reboot.png");
        }
      '';
    };

    home.file.".config/wlogout/icons/".source = pkgs.stdenv.mkDerivation { 
      name = "wlogout-icons";
      
      src = pkgs.fetchFromGitHub {
        owner = "ArtsyMacaw";
        repo = "wlogout";
        rev = "1.2.2";
        sha256 = "sha256-/tYZy56ku68ziSOhy6Dex9RGy+blkU6CN2ze76y7718=";
      };

      installPhase = ''
        mkdir -p $out
        ls
        cp icons/*.png $out
      '';
    };
  };
}
