{ pkgs, ... }: {
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  cachix.enable = false;
  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;
  languages.nix.enable = true;
  pre-commit.hooks = {
    nixpkgs-fmt.enable = true;
    shellcheck.enable = true;
    commitizen.enable = true;
    deadnix.enable = true;
  };
  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';
  scripts.about.exec = ''
    ${pkgs.glow}/bin/glow -p ./README.md
    less ./LICENSE
  '';

  enterShell = ''
    hello
    git --version
    nixpkgs-fmt --version
  '';

  # https://devenv.sh/tests/
  enterTest =
    # shell
    ''
      echo "Running tests"
      git --version | grep --color=auto "${pkgs.git.version}"
    '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
