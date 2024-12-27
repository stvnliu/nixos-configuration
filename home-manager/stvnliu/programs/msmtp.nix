{
  pkgs,
  config,
  ...
}: {
  programs.msmtp = {
    enable = true;
  };
}
