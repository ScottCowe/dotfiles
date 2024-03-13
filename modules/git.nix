{ config, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Scott Cowe";
    userEmail = "scott.t.cowe@gmail.com";
  };
}
