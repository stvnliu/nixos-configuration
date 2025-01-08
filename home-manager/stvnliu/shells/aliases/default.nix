{ pkgs }: {
  gil = "${pkgs.lazygit}/bin/lazygit";
  cd = "z";
  cdi = "zi";
  cat = "${pkgs.bat}/bin/bat";
  ls = "${pkgs.lsd}/bin/lsd";
  ll = "ls -l";
  rm = "${pkgs.trash-cli}/bin/trash";
  osupdate = "${pkgs.nh}/bin/nh os switch";
  homeupdate = "${pkgs.nh}/bin/nh home switch";
  batmon = "watch -n0 upower -i /org/freedesktop/UPower/devices/battery_BAT1";
  inception = "${pkgs.pipx}/bin/pipx run copier copy --trust gh:DataChefHQ/Inception .";
}
