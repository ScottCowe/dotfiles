{ pkgs, lib, config, inputs, ... }:

with lib;
let
  cfg = config.modules.ssh;
in {
  options.modules.ssh = { enable = mkEnableOption "ssh"; };
  config = mkIf cfg.enable {
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
