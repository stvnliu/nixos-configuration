{ pkgs, ... }:
{
  home.packages = with pkgs; [ bottles zeroad ];
}
