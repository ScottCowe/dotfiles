{
  description = "NixOS config";

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
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs; };
          modules = [
            { networking.hostName = hostname; }
            
            (./. + "/hosts/${hostname}/configuration.nix")
            (./. + "/hosts/${hostname}/hardware-configuration.nix")
            
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                users.cowe = (./. + "/hosts/${hostname}/home.nix"); 
              };   
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem inputs.nixpkgs "x86_64-linux" "desktop";
        #desktop = nixpkgs.lib.nixosSystem {
        #specialArgs = { inherit inputs; };
        #  modules = [ 
        #    ./hosts/desktop/configuration.nix
        #    home-manager.nixosModules.default
        #  ];
        #};

        #laptop = nixpkgs.lib.nixosSystem {
        #  specialArgs = {inherit inputs;};
        #  modules = [ 
        #    ./hosts/laptop/configuration.nix
        #    inputs.home-manager.nixosModules.default
        #  ];
        #};
      };
    };
}
