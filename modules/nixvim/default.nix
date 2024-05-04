{ pkgs, lib, config, ... }:

with lib;
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "main";
  });

  cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim"; };
  config = mkIf cfg.enable {
    imports = [
      nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
      enable = true;
    };
  };
}
