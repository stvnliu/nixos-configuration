{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hypr
    ./shells
    ../../common/variables.nix
    ./mako.nix
    ./wechat
    ./editors.nix
    ./gtk.nix
    ./ags
    ./xdg.nix
    ./stylix.nix
    ./spicetify.nix
    ./scripts
    ./programs
    ./packages
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      (final: prev: {
        ags = prev.ags.overrideAttrs (old: {
          buildInputs = old.buildInputs ++ [pkgs.libdbusmenu-gtk3];
        });
      })
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
    file = {"wallpaper.jpg".source = config.myWallPaperPath;};
  };
  home.packages = with pkgs; [
    prismlauncher
    protonvpn-gui
    devenv
    vlc
    rhythmbox
    qq
    shotwell
    mpv
    kdenlive
    obsidian
    pcmanfm
    udiskie
    teams-for-linux
    sxiv
    heroic
  ];
  myAutostartCommands = [
    #"${pkgs.clash-verge-rev}/bin/clash-verge"
    "${config.programs.firefox.package}/bin/firefox"
    "${pkgs.thunderbird}/bin/thunderbird"
  ];

  programs = {
    obs-studio = {
      enable = true;
      plugins = [pkgs.obs-studio-plugins.wlrobs];
    };
    home-manager.enable = true;
    firefox = {
      enable = true;
      package = with pkgs; (firefox-devedition.override {
        nativeMessagingHosts = [
          (passff-host.overrideAttrs (old: {
            dontStrip = true;
            patchPhase = ''sed -i 's#COMMAND = "pass"#COMMAND = "${
                pass.withExtensions (ext:
                  with ext; [
                    pass-otp
                    pass-import
                  ])
              }/bin/pass"#' src/passff.py'';
          }))
        ];
      });
    };
    thunderbird = {
      enable = true;
      profiles.default = {isDefault = true;};
    };
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
