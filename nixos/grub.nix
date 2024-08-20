{
  config,
  pkgs,
  ...
}: let
  distro-grub-themes = pkgs.stdenv.mkDerivation {
    pname = "distro-grub-themes";
    version = "3.1";
    src = pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      rev = "v3.1";
      hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
    };
    installPhase = "cp -r customize/nixos $out";
  };
  xenlism-grub-themes = pkgs.stdenv.mkDerivation {
    pname = "xenlism-grub-themes";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "xenlism";
      repo = "Grub-themes";
      rev = "40ac048df9aacfc053c515b97fcd24af1a06762f";
      hash = "sha256-ProTKsFocIxWAFbYgQ46A+GVZ7mUHXxZrvdiPJqZJ6I=";
    };
    installPhase = "cp -r xenlism-grub-1080p-nixos/Xenlism-Nixos $out";
  };
in {
  environment.systemPackages = with pkgs; [hack-font];
  boot.supportedFilesystems = ["ntfs"];
  #fileSystems."/mnt/winsys" = {
  #	device = "/dev/nvme0n1p5";
  #	fsType = "ntfs-3g";
  #	options = [ "rw" "uid=1000" ];
  #};
  #fileSystems."/mnt/windata" = {
  #	device = "/dev/nvme0n1p3";
  #	fsType = "ntfs-3g";
  #	options = [ "rw" "uid=1000" ];
  #};
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      fsIdentifier = "label";
      devices = ["nodev"];
      extraEntries = ''
        	menuentry "Reboot" {
        		reboot
        	}
        menuentry "Poweroff" {
        	halt
        }
      '';
      useOSProber = true;
      configurationLimit = 10;
      theme = xenlism-grub-themes;
    };
  };
}
