{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc-bin
    jetbrains.pycharm-professional
    jetbrains.rust-rover
    discord
    youtube-music
  ];
  imports = [
    # common home-manager configs
    ./alacritty.nix
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./direnv
    ./eza.nix
    ./fish
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./kitty.nix
    ./lazygit.nix
    ./ncspot.nix
    ./neovim
    ./ripgrep.nix
    ./ssh
    ./starship
    ./termusic.nix
    ./tmux.nix
    ./wezterm
    ./yazi.nix
    ./yt-dlp.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
