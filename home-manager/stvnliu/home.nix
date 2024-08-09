#his is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    #./swaywm.nix
    ./hypr
    ./shells
    ./variables.nix
    ./mako.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "${config.myUserName}";
    homeDirectory = "/home/${config.myUserName}";
    # copy wallpaper from assets
    file = {
      "wallpaper.png".source = ./assets/gruvbox-wallpaper.png;
    };
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number
    '';
  };
  home.packages = with pkgs; [
    protonvpn-gui
    devenv
    vlc
  ];
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = config.myDisplayName;
    userEmail = config.myEmail;
    extraConfig = {
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "/home/${config.myUserName}/.ssh/allowed_signers";
      user.signingkey = "/home/${config.myUserName}/.ssh/id_ed25519.pub";
      credential.helper = "libsecret";
    };
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
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
      docked = {
        outputs = [
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "eDP-1";
            position = "0,0";
            status = "enable";
          }
        ];
      };
    };
    systemdTarget = "hyprland-session.target";
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
