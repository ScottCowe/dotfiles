{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.vim;
in {
  options.modules.vim = { enable = mkEnableOption "vim"; };
  config = mkIf cfg.enable {
    programs.vim = {
      enable = true;

      settings = {
        number = true;
        relativeNumber = true;
        tabstop = 4;
      };
    };
  };
}
