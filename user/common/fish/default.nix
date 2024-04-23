{ pkgs, ... }:

let
  fish_path =
    if pkgs.stdenv.isDarwin then ''
      # fish path stuff
      fish_add_path /run/current-system/sw/bin
      fish_add_path /Users/jan/.nix-profile/bin
      fish_add_path /etc/profiles/per-user/jan/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /Users/jan/.cargo/bin
      fish_add_path /Users/jan/.local/bin
    ''
    else ''
      # fish path stuff
      fish_add_path /home/jan/.cargo/bin
      fish_add_path /home/jan/.local/bin
      fish_add_path /home/jan/.npm-global/bin
    '';
in

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting

      # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
      complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

      # 1password completions
      op completion fish | source
      source ~/.config/op/plugins.sh

      # allow 1password-cli ssh-agent to see which keys are available
      # `ssh-add -l` will now show all available ssh-keys from 1password
      set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

      # set -x NVIM_APPNAME nvim-astro
      set -x PIPENV_VENV_IN_PROJECT 1

      # name: 'Catppuccin mocha'
      # url: 'https://github.com/catppuccin/fish'
      # preferred_background: 1e1e2e
      set fish_color_normal cdd6f4
      set fish_color_command 89b4fa
      set fish_color_param f2cdcd
      set fish_color_keyword f38ba8
      set fish_color_quote a6e3a1
      set fish_color_redirection f5c2e7
      set fish_color_end fab387
      set fish_color_comment 7f849c
      set fish_color_error f38ba8
      set fish_color_gray 6c7086
      set fish_color_selection --background=313244
      set fish_color_search_match --background=313244
      set fish_color_option a6e3a1
      set fish_color_operator f5c2e7
      set fish_color_escape eba0ac
      set fish_color_autosuggestion 6c7086
      set fish_color_cancel f38ba8
      set fish_color_cwd f9e2af
      set fish_color_user 94e2d5
      set fish_color_host 89b4fa
      set fish_color_host_remote a6e3a1
      set fish_color_status f38ba8
      set fish_pager_color_progress 6c7086
      set fish_pager_color_prefix f5c2e7
      set fish_pager_color_completion cdd6f4
      set fish_pager_color_description 6c7086
    '' + fish_path;
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
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
  };

  xdg.configFile."fish/functions" = {
    source = ./functions;
    recursive = true;
  };
}
