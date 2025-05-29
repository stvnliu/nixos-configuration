{ pkgs, config, lib, ... }:
lib.mkIf config.usingMusicPlayerDaemon {
  home.packages = [ pkgs.ncmpc ];
  services = {
    mpd = {
      enable = true;
      network.listenAddress = "any";
      network.port = 6600;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "my pipewire output"
        }
      '';
    };
    mpd-mpris = { enable = true; };
  };
}
