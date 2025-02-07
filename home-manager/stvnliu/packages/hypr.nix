{ inputs, ... }:
{
  home.packages = [ inputs.hyprswitch.packages.x86_64-linux.default ];
}
