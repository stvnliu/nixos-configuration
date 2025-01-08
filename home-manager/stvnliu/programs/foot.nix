{ pkgs
, config
, lib
, ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = lib.mkForce "yes";
      };
      mouse = { hide-when-typing = "yes"; };
    };
    server.enable = true;
  };
}
