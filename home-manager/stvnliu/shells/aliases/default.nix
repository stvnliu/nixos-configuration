{pkgs}: {
  cd = "z";
  cdi = "zi";
  ls = "${pkgs.lsd}/bin/lsd";
  cat = "${pkgs.bat}/bin/bat";
  ll = "ls -l";
  rm = "${pkgs.trash-cli}/bin/trash";
  osupdate = "${pkgs.nh}/bin/nh os switch";
  homeupdate = "${pkgs.nh}/bin/nh home switch";
  batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
}
