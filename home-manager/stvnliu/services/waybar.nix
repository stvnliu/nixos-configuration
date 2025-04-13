{ ... }: {
  programs.waybar = {
    enable = true;
    systemd = { enable = true; };
    style = "${import ./waybar_style.nix { }}";
    settings = import ./waybar_config.nix;
  };
}
