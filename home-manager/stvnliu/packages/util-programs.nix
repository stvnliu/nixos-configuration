{ pkgs, ... }: {
  home.packages = with pkgs; [
    bottom
    libnotify
    tree
    android-file-transfer
    mtpfs
    usbutils
    glow
    tmux
    ranger
    lazygit
    mmv
    cheat
    thefuck
    pcmanfm
    udiskie
    sxiv
    transmission_4-gtk
  ];
}
