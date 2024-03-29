{ pkgs, ... }:

{
  imports = [
    ./system.nix
    ./packages.nix
    ./shell.nix
  ];
  programs.fish.enable = true;
  users.users.user.shell = pkgs.fish;
  nix.settings.trusted-users = [ "root" "jan" ];
}
