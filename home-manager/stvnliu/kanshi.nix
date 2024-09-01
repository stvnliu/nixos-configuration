{
  pkgs,
  config,
  ...
}: {
  services.kanshi = {
    enable = true;
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
      docked_office_cn = {
        outputs = [
          {
            criteria = "AOC 2619 M1194JA002428";
            position = "0,0";
            mode = "1920x1200@59.94Hz";
          }
          {
            criteria = "eDP-1";
            position = "0,0";
            status = "disable";
          }
        ];
      };
      docked_office_gr = {
        outputs = [
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            mode = "1920x1080@60.00Hz";
          }
          {
            criteria = "eDP-1";
            position = "0,0";
            status = "disable";
          }
        ];
      };
    };
    systemdTarget = "hyprland-session.target";
  };
}
