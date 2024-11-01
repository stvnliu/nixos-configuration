{
  pkgs,
  config,
  lib,
  ...
}: {
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
  ];
}
