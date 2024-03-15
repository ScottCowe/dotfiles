{ inputs, pkgs, config, ... }:

{
  imports = [
    ./git
    ./zsh
    ./vim
    ./firefox
  ];
}
