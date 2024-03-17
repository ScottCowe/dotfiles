{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    jdk
    gradle
  ];

  shellHook = ''
    exec zsh
  '';
}
