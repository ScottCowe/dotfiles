{ config, lib, pkgs, inputs, ... }:

{
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
