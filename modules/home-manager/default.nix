{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";
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

  programs.bat = {
  	enable = true;
  	config.theme = "TwoDark";
  };

  programs.direnv = {
  	enable = true;
	nix-direnv.enable = true;
  };

  programs.fzf = {
  	enable = true;
	colors = {
		fg="#c0caf5,bg:#1a1b26,hl:#bb9af7";
		"fg+"="#c0caf5,bg+:#1a1b26,hl+:#7dcfff";
		info="#7aa2f7,prompt:#7dcfff,pointer:#7dcfff";
		marker="#9ece6a,spinner:#9ece6a,header:#9ece6a";
	};
  };

  programs.zoxide. enable = true;

  programs.exa = {
  	enable = true;
	enableAliases = true;
	extraOptions = [
	  "--header"
	  "--group-directories-first"
	  "--group"
	  "--git"
	  "--bytes"
	];
  };

  programs.git = {
  	enable = true;
  };

  programs.bash = {
  	enable = true;
  };

  programs.btop = {
  	enable = true;
  };

  programs.zsh = {
	enable = true;
	  enableCompletion = true;
	  enableAutosuggestions = true;
	  syntaxHighlighting.enable = true;
	  shellAliases = {
	    nixswitch = "darwin-rebuild switch --flake ~/code/lj/system-config/.#";
	    nixup = "pushd ~/code/lj/system-config; nix flake update; nixswitch; popd";
	  };
  };



  programs.fish = {
    enable = true;
    plugins = [
       {
		name = "autopair";
		src = pkgs.fetchFromGitHub {
			owner = "jorgebucaran";
			repo = "autopair.fish";
			rev = "1.0.4";
			sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
		};
	}

       {
		name = "replay";
		src = pkgs.fetchFromGitHub {
			owner = "jorgebucaran";
			repo = "replay.fish";
			rev = "1.2.1";
			sha256 = "sha256-bM6+oAd/HXaVgpJMut8bwqO54Le33hwO9qet9paK1kY=";
		};
	}
    ];
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

  programs.starship = {
  	enable = true;
  };
  
  programs.alacritty = {
    enable = true;
    settings.font.normal.family = "MesloLGS Nerd Font Mono";
    settings.font.size = 16;
  };
}
