{ lib, config, ... }:

with lib; {
  options.common.lf = { 
    enable = mkEnableOption "lf"; 
  };

  config = mkIf config.common.lf.enable {
    programs.lf = {
      enable = true;
    };
  };
}
