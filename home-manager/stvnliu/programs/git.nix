{ pkgs
, config
, ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = config.myDisplayName;
    userEmail = config.myEmail;
    extraConfig = {
      core.autocrlf = "input";
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      #gpg.format = "ssh";
      #gpg.ssh.allowedSignersFile = "/home/${config.myUserName}/.ssh/allowed_signers";
      #user.signingkey = "/home/${config.myUserName}/.ssh/id_ed25519.pub";
      user.signingkey = "DC8F48E7B4C40905";
      credential.helper = "libsecret";
    };
  };
}
