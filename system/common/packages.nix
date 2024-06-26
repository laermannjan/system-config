{ pkgs, ... }:

let
  rust = pkgs.rust-bin.stable.latest.default.override {
    targets = [ "wasm32-unknown-unknown" ];
  };
in
{
  # System-Wide Packages
  environment.systemPackages = with pkgs; [
    # Terminal
    tree
    parallel
    curl
    ripgrep
    fd
    sd
    rsync
    bc
    jq
    neovim


    # ssh
    openssh
    ssh-copy-id


    # archive
    xz
    zstd
    lz4
    p7zip

    # programming
    rust
    python3
    luajit

    # media
    ffmpeg
    pandoc
    dogdns
  ];
}
