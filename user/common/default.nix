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
    ./termusic.nix
    ./tmux.nix
    ./wezterm.nix
    ./yazi.nix
    ./yt-dlp.nix
    ./zoxide.nix
  ];
}
