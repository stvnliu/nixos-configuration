{ pkgs
, config
, ...
}: {
  home.packages = with pkgs; [
    wget
  ];
}
