{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  myHomeManager = {
    wezterm.enable = true;
  };

  home = {
    stateVersion = "24.05";
  };
}
