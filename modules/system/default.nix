{
  pkgs,
  config,
  lib,
  inputs,
  outputs,
  myLib,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    # inputs.home-manager.nixosModules.home-manager
  ];

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };
}
