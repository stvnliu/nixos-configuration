{ lib
, ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = lib.mkForce "no";
      };
      mouse = { hide-when-typing = "yes"; };
    };
    server.enable = true;
  };
}
