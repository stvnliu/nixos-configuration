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
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {selected_themes = ["rings"];})
      ];
    };

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
    supportedFilesystems = ["ntfs"];
    loader = {
      #timeout = 0;
      efi = {canTouchEfiVariables = true;};
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        devices = ["nodev"];
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
          ### BEGIN /etc/grub.d/10_linux ###
          menuentry 'Arch Linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-996df93f-0794-450a-9315-38f188e85878' {
          	load_video
          	set gfxpayload=keep
          	insmod gzio
          	insmod part_gpt
          	insmod fat
          	search --no-floppy --fs-uuid --set=root 2E4F-3060
          	echo	'Loading Linux linux ...'
          	linux	/vmlinuz-linux root=UUID=996df93f-0794-450a-9315-38f188e85878 rw  loglevel=3 quiet
          	echo	'Loading initial ramdisk ...'
          	initrd	/amd-ucode.img /initramfs-linux.img
          }
          submenu 'Advanced options for Arch Linux' $menuentry_id_option 'gnulinux-advanced-996df93f-0794-450a-9315-38f188e85878' {
          	menuentry 'Arch Linux, with Linux linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-advanced-996df93f-0794-450a-9315-38f188e85878' {
          		load_video
          		set gfxpayload=keep
          		insmod gzio
          		insmod part_gpt
          		insmod fat
          		search --no-floppy --fs-uuid --set=root 2E4F-3060
          		echo	'Loading Linux linux ...'
          		linux	/vmlinuz-linux root=UUID=996df93f-0794-450a-9315-38f188e85878 rw  loglevel=3 quiet
          		echo	'Loading initial ramdisk ...'
          		initrd	/amd-ucode.img /initramfs-linux.img
          	}
          	menuentry 'Arch Linux, with Linux linux (fallback initramfs)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-fallback-996df93f-0794-450a-9315-38f188e85878' {
          		load_video
          		set gfxpayload=keep
          		insmod gzio
          		insmod part_gpt
          		insmod fat
          		search --no-floppy --fs-uuid --set=root 2E4F-3060
          		echo	'Loading Linux linux ...'
          		linux	/vmlinuz-linux root=UUID=996df93f-0794-450a-9315-38f188e85878 rw  loglevel=3 quiet
          		echo	'Loading initial ramdisk ...'
          		initrd	/amd-ucode.img /initramfs-linux-fallback.img
          	}
          }

          ### END /etc/grub.d/10_linux ###

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
        #useOSProber = true;
        configurationLimit = 10;
        fontSize = 32;
        theme = xenlism-grub-themes;
      };
    };
  };
}
