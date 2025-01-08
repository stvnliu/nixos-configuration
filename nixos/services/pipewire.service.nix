{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.configPackages = [
      (pkgs.writeTextDir
        "share/wireplumber/wireplumber.conf.d/52-profile-switch.conf" ''
        wireplumber.settings = {
          bluetooth.autoswitch-to-headset-profile = false
        }

        monitor.bluez.properties = {
          ## Supported roles: hsp_hs (HSP Headset),
          ##                  hsp_ag (HSP Audio Gateway),
          ##                  hfp_hf (HFP Hands-Free),
          ##                  hfp_ag (HFP Audio Gateway)
          ##                  a2dp_sink (A2DP Audio Sink)
          ##                  a2dp_source (A2DP Audio Source)
          ##                  bap_sink (LE Audio Basic Audio Profile Sink)
          ##                  bap_source (LE Audio Basic Audio Profile Source)
          ## --
          ## Only enable A2DP here and disable HFP. See note at the top as to why.
          bluez5.roles = [ a2dp_sink a2dp_source ]
        }
      '')
      (pkgs.writeTextDir
        "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
        bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
        }
      '')
    ];
    #extraConfig.pipewire."99-input-denoising" = pw_rnnoise_config;
  };
}
