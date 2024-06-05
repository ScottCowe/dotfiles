{ lib, config, pkgs, ... }:

with lib; {
  options.ssh = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable home manager config for ssh 
      '';
    };
  };

  config = mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    services.ssh-agent.enable = true;
  };
}
