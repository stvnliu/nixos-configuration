{ pkgs, config, lib, ... }:
lib.mkIf config.usingMusicPlayerDaemon {
  home.packages = [ pkgs.ncmpc ];
  services.mpd = {
    enable = true;
    network.listenAddress = "any";
    network.port = 6600;
    extraConfig = ''
       audio_output {
         type "pipewire"
         name "my pipewire output"
       }
       audio_output {
       	type		"httpd"
         name		"My HTTP Stream"
         encoder		"vorbis"		# optional, vorbis or lame
         port		"8000"
       #	bind_to_address	"0.0.0.0"		# optional, IPv4 or IPv6
       quality		"5.0"			# do not define if bitrate is defined
       #	bitrate		"128"			# do not define if quality is defined
      	format		"44100:16:1"
       max_clients	"5"			# optional 0=no limit
       }
    '';
  };
  services.mpd-mpris = {
    enable = true;
  };
}
