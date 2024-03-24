{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    #jdk
    #gradle
    jetbrains.idea-community
  ];

  LD_LIBRARY_PATH = "${pkgs.libglvnd}";

  shellHook = ''
    exec zsh
  '';
}
