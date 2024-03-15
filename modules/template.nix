{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.THING;
in {
  options.modules.THING = { enable = mkEnableOption "thing"; };
  config = mkIf cfg.enable {
    programs.THING = {
      enable = true;
    };
  };
}
