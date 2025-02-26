{ config, lib, ... }: {
  programs.hyprlock = lib.mkForce {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [{
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      }];

      input-field = [{
        size = "400, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(${config.lib.stylix.colors.base07})";
        inner_color = "rgb(${config.lib.stylix.colors.base02})";
        outer_color = "rgb(${config.lib.stylix.colors.base03})";
        outline_thickness = 1;
        placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
        shadow_passes = 2;
      }];
    };
  };
}
