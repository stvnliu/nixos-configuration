{ config }: {
  hyprbars = {
    bar_height = 38;
    bar_color = "rgb(1e1e1e)";
    "col.text" = "ffffff";
    bar_text_size = 12;
    bar_text_font = config.desktopFont.fullName;
    bar_button_padding = 12;
    bar_padding = 10;
    bar_precedence_over_border = true;
    hyprbars-button = [
      "rgb(ffffff), 20, 󰅖, hyprctl dispatch killactive;"
      "rgb(ffffff), 20, 󰊓, hyprctl dispatch fullscreen 2;"
    ];
  };
}
