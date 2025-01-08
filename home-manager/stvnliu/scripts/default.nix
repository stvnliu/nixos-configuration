{ config
, pkgs
, ...
}: {
  home.packages = [
    (import ./heic-to-jpg.script.nix { inherit pkgs; })
    (import ./tmux-default.script.nix {
      inherit pkgs;
      inherit config;
    })
    (import ./git-check.script.nix {
      inherit pkgs;
      inherit config;
    })
  ];
}
