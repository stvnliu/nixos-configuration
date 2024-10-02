{...}: {
  imports = [
    ./nginx.service.nix
    ./pipewire.service.nix
    ./syncthing.service.nix
    ./misc.service.nix
    ./avahi.service.nix
    ./printing.service.nix
    ./tailscale.service.nix
    ./power_management.service.nix
    ./seatd.service.nix
    ./logind.service.nix
  ];
}
