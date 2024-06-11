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

    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkSystem = pkgs: system: stateVersion: hostname:
        pkgs.lib.nixosSystem {
          specialArgs = { 
            inherit inputs; 
          };

          modules = [
            { 
              networking.hostName = hostname; 
              system.stateVersion = "${stateVersion}";
              nix.settings.experimental-features = [ "nix-command" "flakes" ];
            }

            ./systems/${hostname}
            
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { 
                  inherit inputs; 
                  inherit system;
                };
                users.cowe = pkgs.lib.mkMerge [
                  ./systems/${hostname}/home.nix
                  { home.stateVersion = "${stateVersion}"; }
                ];
              };   
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem inputs.nixpkgs "x86_64-linux" "23.11" "desktop";
        hp-laptop = mkSystem inputs.nixpkgs "x86_64-linux" "23.11" "hp-laptop";
      };
    };
}
