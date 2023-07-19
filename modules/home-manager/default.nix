{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    neovim
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.exa.enable = true;
  programs.git.enable = true;
  programs.zsh = {
	enable = true;
	  enableCompletion = true;
	  enableAutosuggestions = true;
	  syntaxHighlighting.enable = true;
	  shellAliases = {
	    ls = "ls --color=auto -F";
	    nixswitch = "darwin-rebuild switch --flake ~/code/lj/system-config/.#";
	    nixup = "pushd ~/code/lj/system-config; nix flake update; nixswitch; popd";
	  };
  };



  programs.fish = {
    enable = false;
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
    };
    shellAbbrs = {
      gco = "git checkout";
      gcb = "git checkout -b";
      gc = "git commit -v";
      gcm = "git commit -m";
      gcv = "git commit -m --no-verify";
      gb = "git branch -vv";

      gst = "git status";
      gp = "git push";
      glo = "git log --oneline --decorate --color";
      gloo = "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short";
      ga = "git add";

    };
  };

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.alacritty = {
    enable = true;
    settings.font.normal.family = "MesloLGS Nerd Font Mono";
    settings.font.size = 16;
  };
}
