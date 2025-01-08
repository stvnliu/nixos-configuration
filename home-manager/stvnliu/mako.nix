{ ...
}:
let
  defaultTimeoutMillis = 5 * 1000;
in
{
  services.mako = {
    enable = true;
    defaultTimeout = defaultTimeoutMillis;
  };
}
