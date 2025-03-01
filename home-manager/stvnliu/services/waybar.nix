{ ... }: {
  programs.waybar = {
    enable = true;
    systemd = { enable = true; };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        output = [ "eDP-2" "HDMI-A-1" ];
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "mpd" ];
        modules-right = [
          "clock"
          "group/trays"
          "group/monitor"
          "wireplumber"
          "temperature"
        ];
        "battery" = {
          "bat" = "BAT1";
          "format" = "BAT {capacity}% @ {power}W";
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "tray" = {
          "icon-size" = 18;
          "spacing" = 10;
        };
        "custom/tray-label" = { "format" = "[TRAY]"; };
        "custom/monitor-label" = { "format" = "[HW]"; };
        "group/trays" = {
          "orientation" = "inherit";
          "modules" = [ "custom/tray-label" "tray" ];
          "drawer" = { };
        };
        "group/monitor" = {
          "orientation" = "inherit";
          "modules" = [ "custom/monitor-label" "battery" "cpu" "memory" ];
          "drawer" = { };
        };
        "mpd" = {
          "format" =
            "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" =
            "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "interval" = 10;
          "consume-icons" = {
            "on" = " "; # Icon shows only when "consume" is on
          };
          "random-icons" = {
            "off" = ''
              <span color="#f53c3c"></span> ''; # Icon grayed out when "random" is off
            "on" = " ";
          };
          "repeat-icons" = { "on" = " "; };
          "single-icons" = { "on" = " 1 "; };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "wireplumber" = {
          "format" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = [ "" "" "" ];
        };
        "cpu" = {
          "format" = "CPU {icon}";
          "format-icons" = [
            "<span color='#69ff94'>▁</span>" # green
            "<span color='#2aa9ff'>▂</span>" # blue
            "<span color='#f8f8f2'>▃</span>" # white
            "<span color='#f8f8f2'>▄</span>" # white
            "<span color='#ffffa5'>▅</span>" # yellow
            "<span color='#ffffa5'>▆</span>" # yellow
            "<span color='#ff9977'>▇</span>" # orange
            "<span color='#dd532e'>█</span>" # red
          ];
          "memory" = { "format" = "MEM {percentage}%"; };
        };
        "clock" = {
          "format" = "{:%H:%M}  ";
          "format-alt" = "{:%A, %B %d, %Y (%R)}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          /* "actions" = {
               "on-click-right" = "mode";
               "on-scroll-up" = "tz_up";
               "on-scroll-down" = "tz_down";
               "on-scroll-up" = "shift_up";
               "on-scroll-down" = "shift_down";
             };
          */
        };
        /* "custom/hello-from-waybar" = {
             format = "hello {}";
             max-length = 40;
             interval = "once";
             exec = pkgs.writeShellScript "hello-from-waybar" ''
               echo "from within waybar"
             '';
           };
        */
      };
    };
  };
}
