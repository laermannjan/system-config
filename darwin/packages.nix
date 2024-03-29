{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    raycast
    stats
    iina
  ];
}
