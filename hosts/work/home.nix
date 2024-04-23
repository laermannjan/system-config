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
}
