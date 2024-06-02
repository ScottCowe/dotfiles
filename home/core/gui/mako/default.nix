{ lib, config, inputs, ... }:

with lib; {
  options.gui.mako = { 
    enable = mkEnableOption "mako"; 
  };

  config = mkIf config.gui.mako.enable {
    # colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha; 

    services.mako = with config.colorScheme.palette; {
      enable = true;
      backgroundColor = "#${base01}";
      borderColor = "#${base0D}";
      borderRadius = 5;
      borderSize = 2;
      textColor = "#${base04}";
      layer = "overlay";
      defaultTimeout = 5000;
    };
  };
}
