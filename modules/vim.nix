{ config, pkgs, inputs, ... }:

{
  programs.vim = {
    enable = true;
		
    settings = {
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
  };
}
