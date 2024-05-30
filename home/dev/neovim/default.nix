{ lib, config, inputs, system, ... }:

with lib; {
  options.neovim = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable neovim 
      '';
    };
  }; 
  
  config = mkIf config.neovim.enable {
    home.packages = [
      inputs.nixvim-flake.packages.${system}.default
    ];
  }; 
}
