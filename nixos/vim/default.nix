{ lib, config, pkgs, ... }:

with lib; {
  options.vim = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable vim 
      '';
    };
  };

  config = mkIf config.vim.enable {
    environment.systemPackages = with pkgs; [
      vim
    ]; 
  };
}
