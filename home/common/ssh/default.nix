{ lib, config, ... }:

with lib; {
  options.ssh = {
    enable = mkOption {
      type = types.bool;
      default = true;
      example = true;
      description = mdDoc ''
        Whether to enable ssh 
      '';
    };
  };

  config = mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host *
        AddKeysToAgent yes
      '';
    };

    services.ssh-agent.enable = true;
  };
}
