{
  lib,
  config,
  inputs,
  outputs,
  utils,
  pkgs,
  ...
}: let
  cfg = config.myNixOS;
in {
  options.myNixOS = {
    userName = lib.mkOption {
      default = "jan";
      description = ''
        username
      '';
    };

    userConfig = lib.mkOption {
      description = ''
        home-manager config path
      '';
    };

    userNixosSettings = lib.mkOption {
      default = {};
      description = ''
        NixOS user settings
      '';
    };
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        utils = utils;
        outputs = inputs.self.outputs;
      };
      users = {
        ${cfg.userName} = {...}: {
          imports = [
            (import cfg.userConfig)
            outputs.modules.home.default
          ];
        };
      };
    };

    users.users.${cfg.userName} =
      {
        description = cfg.userName;
        shell = pkgs.fish;
      }
      // cfg.userNixosSettings;
  };
}
