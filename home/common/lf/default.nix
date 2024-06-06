{ lib, config, pkgs, ... }:

with lib; {
  options.common.lf = { 
    enable = mkEnableOption "lf"; 
  };

  config = mkIf config.common.lf.enable {
    home.file.".config/lf/icons".source = ./icons;
    home.file.".config/lf/colors".source = ./colors;

    programs.lf = {
      enable = true;

      settings = {
        preview = true;
        hidden = true;
        icons = true;
        ignorecase = true;
        drawbox = true;
      };

      keybindings = {
        y = "copy";
        x = "cut";
        p = "paste";
        o = "editor-open";
      };

      commands = {
        editor-open = ''$$EDITOR $f'';
      };

      extraConfig = 
      let 
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5
          
          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi
          
          ${pkgs.pistol}/bin/pistol "$file"
        '';

        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in
      ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
    };
  };
}
