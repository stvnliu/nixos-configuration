{
  config,
  pkgs,
  ...
}: {
  home.packages = [(import ./heic-to-jpg.script.nix {inherit pkgs;})];
}
