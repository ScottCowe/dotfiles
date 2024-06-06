{ lib, config, inputs, system, ... }:

with lib; {
  options.dev.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = mdDoc ''
        Whether to enable neovim 
      '';
    };
  }; 
  
  config = mkIf config.dev.neovim.enable {
    home.packages = [ inputs.nixvim-flake.packages.${system}.default ];
    home.sessionVariables.EDITOR = "nvim";
  }; 
}
