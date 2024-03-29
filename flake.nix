{
    description = "Jans NixOS/MacOS configs";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nix-darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        flake-parts.url = "github:hercules-ci/flake-parts";  # allows me to split up the flake into separate files
        nixos-flake.url = "github:srid/nixos-flake";  # unified interface for nixos, nix-darwin, home-manager
        flake-root.url = "github:srid/flake-root";  # let's me specify the root of this flake hierarchy
        rust-overlay.url = "github:oxalica/rust-overlay";

    };


    outputs = inputs @ { self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      imports = [
        inputs.nixos-flake.flakeModule
        inputs.flake-root.flakeModule
      ];

      flake =
        let
          stateVersion = "23.11";
          darwinStateVersion = 4;
          homeStateVersion = "23.11";
        in
        {
            darwinConfigurations = {
                macbook = self.nixos-flake.lib.mkMacosSystem {
                nixpkgs.hostPlatform = "aarch64-darwin";
                imports = [
                    self.nixosModules.common
                    self.nixosModules.darwin
                    # Your home-manager configuration
                    self.darwinModules_.home-manager
                    {
                    home-manager.users.jan = {
                        imports = [
                            self.homeModules.common
                            self.homeModules.darwin
                        ];
                        home.stateVersion = homeStateVersion;
                    };
                    }
                ];
            };
        };

         # All nixos/nix-darwin configurations are kept here.
          nixosModules = {
            # Common nixos/nix-darwin configuration shared between Linux and macOS.
            common = {
              imports = [
                # Custom inputs
                {
                  nixpkgs.overlays = [
                    inputs.rust-overlay.overlays.default
                #     inputs.agenix.overlays.default
                #     inputs.neovix.overlays.default
                  ];
                }
                (import ./common)
              ];
            };
            # NixOS specific configuration
            # linux = {
            #   imports = [
            #     # Custom inputs
            #     inputs.impermanence.nixosModules.impermanence
            #     inputs.disko.nixosModules.disko
            #     (import ./linux)
            #   ];
            #   system.stateVersion = "${stateVersion}";
            # };
            # nix-darwin specific configuration
            darwin = {
              imports = [ (import ./darwin) ];
              system.stateVersion = darwinStateVersion;
            };
          };

          # All home-manager configurations are kept here.
          homeModules = {
            # Common home-manager configuration shared between Linux and macOS.
            common = import ./home-manager;
            # # home-manager config specific to NixOS
            # linux = import ./home-manager/linux;
            # home-manager config specifi to Darwin
            darwin = import ./home-manager/darwin;
          };
        };
    };



}
