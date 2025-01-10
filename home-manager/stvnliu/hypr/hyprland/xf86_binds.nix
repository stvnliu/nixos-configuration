{ pkgs
,
}: [
  ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
  ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
  ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
  ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
  ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
  ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
]
