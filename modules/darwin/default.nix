{ pkgs, ... }: {

  users.users.jan.home = "/Users/jan";
  users.users.jan.shell = pkgs.fish;

  # here go the darwin preferences and config items
  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment = {
    shells = with pkgs; [ bash zsh fish ];
    loginShell = pkgs.fish;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ];
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixUnstable;
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  # backwards compat; don't change
  system.stateVersion = 4;
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = {
      rcmd =  1596282165;
      TheUnarchiver = 425425353;
      pandan = 1659600264;
      Velja = 1607635845;
    };
    casks = [ "raycast" "amethyst" "pycharm" "visual-studio-code" "1password" "docker" "brave-browser" "karabiner-elements" "fantastical" "obsidian" "stats" "vlc"];
    # taps = [ "fujiapple852/trippy" ];
    # brews = [ "trippy" ];
  };
}
