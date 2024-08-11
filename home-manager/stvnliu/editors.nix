{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    #./vscode.nix
    #./intellij.nix
  ];
  programs.nixvim = import ./nixvim;
  # dependencies for nixvim configuration
  home.packages = with pkgs; [ripgrep fd];
}
