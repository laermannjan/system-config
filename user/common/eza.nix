{ config, pkgs, lib, ... }:

{
  programs = {
    eza = {
      enable = true;
      extraOptions = [ "--group-directories-first" "--header" "--group" "--git" ];
    };
  };
}
