{ config, pkgs, lib, ... }:

{
  programs = {
    awscli = {
      enable = true;
      settings = {
        "default" = {
           region = "eu-central-1";
        };
      };
    };
  };
}
