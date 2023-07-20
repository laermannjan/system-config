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
    # MANPAGER = "sh -c 'col -bx | bat -l man -p'";
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
         name = "plugin-git";
	 src = pkgs.fishPlugins.plugin-git.src;
       }
       {
         name = "autopair";
	 src = pkgs.fishPlugins.autopair.src;
       }
       {
         name = "colored-man-pages";
	 src = pkgs.fishPlugins.colored-man-pages.src;
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
      nixswitch = "darwin-rebuild switch --flake ~/code/lj/system-config/.#";
      nixup = "pushd ~/code/lj/system-config; nix flake update; nixswitch; popd";

    };
    shellAbbrs = {};
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
