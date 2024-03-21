{ config, lib, pkgs, inputs, ... }:

{
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
