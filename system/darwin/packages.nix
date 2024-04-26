{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    unnaturalscrollwheels
    monitorcontrol
    raycast
    stats
    iina
    utm
  ];
}
