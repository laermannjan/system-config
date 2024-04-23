{
  config,
  pkgs,
  lib,
  inputs,
  outputs,
  system,
  utils,
  hm,
  ...
}: {
  # # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
  ];

  programs = {
    zsh.enable = true;
    fish.enable = true;

    vim = {
      enable = true;
      enableSensible = true;
    };
  };

  myNixOS = {
    home-manager = {
        enable = true;
        userConfig = ./home.nix;
    };
    darwin-settings.enable = true;
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # ================================================================ #
  # =                         DO NOT TOUCH                         = #
  # ================================================================ #

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
