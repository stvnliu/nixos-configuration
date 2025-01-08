{ pkgs
, config
, lib
, ...
}: {
  home.packages = with pkgs; [ wl-clipboard ];
}
