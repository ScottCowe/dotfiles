{ inputs, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./colors
    ./gimp
    ./fonts
    ./firefox
    ./discord
    ./packages
    ./macchina
    ./lf
  ];
}
