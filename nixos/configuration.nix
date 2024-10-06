# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common/variables.nix
    ./greetd.nix
    ./bootloader.nix
    ./nvidia.nix
    ./fonts.nix
    ./services/laptop.preset.nix
    ./virtualisation.nix
    ./hardware-configuration.nix
  ];
  environment.variables = {
    GDK_SCALE = config.displayScale;
    FLAKE = config.myConfigLocation;
    GTK_IM_MODULE = lib.mkForce "";
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  security.pam.services.hyprlock = {};
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-rime
      fcitx5-chinese-addons
    ];
    #enabled = "ibus";
    #ibus.engines = with pkgs.ibus-engines; [rime];
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  specialisation = {
    in-china.configuration = {
      networking.proxy = {
        default = "http://127.0.0.1:7897/";
        noProxy = "127.0.0.1,localhost,internal.domain";
      };
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    config = {common.default = ["gtk"];};
  };
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = ["network.target" "sound.target"];
    wantedBy = ["default.target"];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
  programs = {
    hyprland.enable = true; # enables Hyprland DM.
    steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall =
        true; # Open ports in the firewall for Steam Local Network Game Transfers
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
    gamemode.enable = true;
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = ["ntfs"];
  };
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  # turned off because timedatectl doesn't like it
  time.hardwareClockInLocalTime = false;
  time.timeZone = "Europe/Athens";
  services = {
    #displayManager.sddm = {
    #  enable = true;
    #  wayland.enable = true;
    #  theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
    #};
    #automatic-timezoned.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    gnome.gnome-keyring.enable = true;
  };
  #programs.sway = {
  #	enable = true;
  #	wrapperFeatures.gtk = true;
  #};
  nixpkgs = {
    overlays = [];
    config = {allowUnfree = true;};
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    extraOptions = ''
      trusted-users = root stvnliu
    '';
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };
  networking = {
    hostName = "${config.myHostName}";
    networkmanager.enable = true;
  };
  users.users = {
    "${config.myUserName}" = {
      initialPassword = "stevenpassword";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      packages = with pkgs; [nh gparted];
      extraGroups = ["wheel" "input" "networkmanager"];
    };
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
