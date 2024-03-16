{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh"; };
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        # ll = "ls -l";
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      oh-my-zsh = {
        enable = true;
        plugins = [ ];
        theme = "robbyrussell";
      };
    };
  };
}
