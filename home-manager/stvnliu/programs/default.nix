{ pkgs
, config
, lib
, ...
}: {
  imports = [
    ./git.nix
    ./rofi.nix
    ./tmux.nix
    ./foot.nix
    #./walker.nix
  ];
}
