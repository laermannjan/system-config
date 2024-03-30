{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc-bin
    jetbrains.pycharm-professional
    jetbrains.rust-rover
  ];
  imports = [
    # common home-manager configs
    ./alacritty.nix
    ./bash.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./eza.nix
    ./fish
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
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