{ config, pkgs, lib, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  xdg.configFile."direnv/lib/1password.sh".source = ./1password.sh;
}
