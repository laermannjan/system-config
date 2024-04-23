{
  pkgs,
  config,
  lib,
  inputs,
  outputs,
  utils,
  ...
}: let
  cfg = config.myNixOS;

  # Taking all modules in ./features and adding enables to them
  features =
    utils.extendModules
    (name: {
      extraOptions = {
        myNixOS.${name}.enable = lib.mkEnableOption "enable my ${name} configuration";
      };

      configExtension = config: (lib.mkIf cfg.${name}.enable config);
    })
    (utils.filesIn ./features);
in {
  imports =
    [
      inputs.home-manager.darwinModules.home-manager
      # inputs.home-manager.nixosModules.home-manager
    ]
    ++ features;

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };
}
