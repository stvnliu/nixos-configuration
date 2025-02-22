{ config, pkgs, lib, ... }: {
  specialisation = {
    wayland = {
      configuration = {
        programs = {
          hyprland = {
            enable = true; # enables Hyprland DM.
            withUWSM = true; # NEW Universal Wayland Session Manager
          };
        };
      };
    };
    xorg = {
      configuration = lib.recursiveUpdate
        {
          services.xserver.displayManager.startx.enable = true;
        }
        (import ./dwm {
          inherit config;
          inherit pkgs;
          inherit lib;
        });
    };
  };
}
