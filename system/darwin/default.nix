{ ... }:

{
  imports = [
    ./system.nix
    ./packages.nix
    ./fonts.nix
    ./brew.nix
  ];
  users.users.jan.home = "/Users/jan";
  # networking.computerName = "laptop";
  # networking.localHostName = "laptop";
}
