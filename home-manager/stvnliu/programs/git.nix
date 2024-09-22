{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = config.myDisplayName;
    userEmail = config.myEmail;
    extraConfig = {
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "/home/${config.myUserName}/.ssh/allowed_signers";
      user.signingkey = "/home/${config.myUserName}/.ssh/id_ed25519.pub";
      credential.helper = "libsecret";
    };
  };
}
