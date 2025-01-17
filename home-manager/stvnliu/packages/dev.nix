{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    wget
    vscodium-fhs
    devenv
  ];
}
