{ config, pkgs, lib, ... }:

{
  programs = {
    wezterm = {
      enable = true;
    };
  };
  xdg.configFile."wezterm" = {
    source = ./wezterm;
    recursive = true;
  };
}
