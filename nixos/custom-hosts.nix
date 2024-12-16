{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.extraHosts = ''
    # home IP mapping

    192.168.2.1 router.home
    192.168.2.2 server.home
  '';
}
