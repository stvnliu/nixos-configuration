{ pkgs
, config
, ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.gitFull;
    userName = config.myDisplayName;
    userEmail = config.myEmail;
    extraConfig = import ./git_config.nix;
  };
}
