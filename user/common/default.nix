{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    vlc-bin
    jetbrains.pycharm-professional
    jetbrains.rust-rover
    discord
    youtube-music
    slack
    lazydocker
    argo
  ];
  imports = [
    # common home-manager configs
    ./alacritty.nix
    ./awscli.nix
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./direnv
    ./eza.nix
    ./fish
    ./fzf.nix
    ./gh.nix
    ./go.nix
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
