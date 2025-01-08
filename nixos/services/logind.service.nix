{ ...
}: {
  services.logind.extraConfig = ''
    # don't shutdown in short press
    HandlePowerKey=ignore

    # Milliseconds
    IdleActionSec=600
  '';
}
