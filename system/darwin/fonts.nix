{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
            "Monaspace"
            "Meslo"
            "SourceCodePro"
            "JetBrainsMono"
            "Inconsolata"
            "Hack"
            "FiraCode"
            "ComicShannsMono"  # try to get ComicCodeMono instead
        ];
      })
    ];
  };
}
