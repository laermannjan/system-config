{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unnaturalscrollwheels
    raycast
    stats
    iina
  ];
}
