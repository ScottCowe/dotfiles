{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.alacritty;
in {
  options.modules.alacritty = { enable = mkEnableOption "alacritty"; };
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        import = [
          (./. + "/catppuccin-mocha.toml")
        ]; 
        font = {
          normal = {
            family = "JetBrains Mono Nerd Font";
            style = "Regular";
          };
        };
      };
    };
  };
}
