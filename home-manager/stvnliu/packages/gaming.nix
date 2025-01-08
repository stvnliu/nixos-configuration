{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ bottles ];
}
