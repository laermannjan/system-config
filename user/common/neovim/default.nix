{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
    };
  };

  home.file.".config/nvim/" = {
     source = ./nvim-config;
     recursive = true;
  };


  home.packages = with pkgs; [
    alejandra
    deadnix
    statix
  ];
}
