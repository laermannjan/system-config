{
  description = "Jan's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {...}: let
    utils = import ./utils.nix {inherit inputs;};
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations = {
      work = utils.mkDarwinSystem ./hosts/work/system.nix;
    };

    # as a reminder; build with $ nixos-rebuild switch|build --flake .#tower
    # nixosConfigurations = {
    #     tower = utils.mkNixosSystem ./hosts/tower/system.nix;
    # };

    homeConfigurations = {
      "jan@work" = utils.mkHome "aarch64-darwin" ./hosts/work/home.nix;
    };

    modules = {
      home.default = ./modules/home;
      system.default = ./modules/system;
    };
  };
}
