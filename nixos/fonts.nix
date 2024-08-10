{pkgs, ...}: {
  fonts.packages = with pkgs; [
    #helvetica-neue-lt-std
    aileron
    corefonts
    #vistafonts
    #vistafonts-chs
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    #mplus-outline-fonts.githubRelease
    #dina-font
    #proggyfonts
    #glasstty-ttf
    (
      nerdfonts.override {
        fonts = [
          #"FiraCode"
          "IBMPlexMono"
          #"IntelOneMono"
          #"CascadiaMono"
          #"CommitMono"
          #"JetBrainsMono"
        ];
      }
    )
  ];
}
