{ pkgs, lib, config, inputs, system, ... }:

with lib;
let
  cfg = config.modules.neovim;
in {
  options.modules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    home.packages = [
      inputs.nixvim-flake.packages.${system}.default
    ];
  };
}
