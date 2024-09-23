{
  pkgs,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.onepunch;
    colorScheme = "Dark";
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
    ];
  };
}
