{ pkgs
, config
, ...
}: {
  imports = [
    ./swaync.nix
    ./mpd.nix
  ];
}
