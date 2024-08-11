{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = config.myShells.zsh.enable;
    enableFishIntegration = config.myShells.fish.enable;
  };
}
