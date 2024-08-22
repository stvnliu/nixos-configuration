{...}: {
  imports = [
    ./nginx.service.nix
    ./pipewire.service.nix
    ./syncthing.service.nix
    ./misc.service.nix
  ];
}
