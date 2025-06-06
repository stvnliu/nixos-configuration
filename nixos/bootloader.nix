{ pkgs
, ...
}:
let
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
in
{
  environment.systemPackages = with pkgs; [ hack-font ];
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
  boot = {
    /*plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override { selected_themes = [ "rings" ]; })
      ];
    };*/

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    supportedFilesystems = [ "ntfs" ];
    loader = {
      #timeout = 0;
      efi = { canTouchEfiVariables = true; };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        devices = [ "nodev" ];
        extraConfig = ''
          function load_video {
            if [ x$feature_all_video_module = xy ]; then
              insmod all_video
            else
              insmod efi_gop
              insmod efi_uga
              insmod ieee1275_fb
              insmod vbe
              insmod vga
              insmod video_bochs
              insmod video_cirrus
            fi
          }'';
        extraEntries = ''

          menuentry "UEFI Firmware Settings" {
            fwsetup
          }
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
        useOSProber = true;
        configurationLimit = 10;
        fontSize = 32;
        theme = xenlism-grub-themes;
      };
    };
  };
}
