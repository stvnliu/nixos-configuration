{ pkgs, ... }: {
  fonts.packages = with pkgs;
    [
      helvetica-neue-lt-std
      aileron
      corefonts
      vistafonts
      vistafonts-chs
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      mplus-outline-fonts.githubRelease
      dina-font

      #proggyfonts
      #glasstty-ttf
    ]
    ++ (with nerd-fonts; [
      ubuntu-mono
      jetbrains-mono
      intone-mono
      fira-code
      commit-mono
      blex-mono
    ]);
}
