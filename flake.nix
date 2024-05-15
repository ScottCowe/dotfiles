{
  description = "ScottCowe's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    nixvim-flake.url = "github:ScottCowe/nixvim-flake";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs; };
          modules = [
            { networking.hostName = hostname; }

            (./. + "/modules/system/configuration.nix")

            (./. + "/hosts/${hostname}/extra.nix")
            (./. + "/hosts/${hostname}/hardware-configuration.nix")
            
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { 
                  inherit inputs; 
                  inherit system;
                };
                users.cowe = (./. + "/hosts/${hostname}/home.nix"); 
              };   
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem inputs.nixpkgs "x86_64-linux" "desktop";
        laptop = mkSystem inputs.nixpkgs "x86_64-linux" "laptop";
      };
    };
}
