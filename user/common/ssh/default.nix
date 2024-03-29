{ ... }:

{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    matchBlocks = {
      "github" = {
        hostname = "github.com";
        forwardX11 = false;
        forwardX11Trusted = false;
      };
      "gitlab" = {
        hostname = "gitlab.com";
        forwardX11 = false;
        forwardX11Trusted = false;
      };
    };
    extraConfig = ''
      IgnoreUnknown AddKeysToAgent,UseKeychain
      AddKeysToAgent yes
      UseKeychain yes
    '';
  };
  home.file.".ssh/known_hosts".source = ./known_hosts;
}
