{ config, pkgs, lib, ... }:

{
  programs = {
    btop = {
      enable = true;
    };
  };
}
