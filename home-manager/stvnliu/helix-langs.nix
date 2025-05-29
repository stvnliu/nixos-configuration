{ pkgs }: [
  {
    name = "nix";
    auto-format = true;
    formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
  }
  {
    name = "python";
    auto-format = true;
    formatter.command = "${pkgs.black}/bin/black";
  }
  {
    name = "rust";
    auto-format = true;
    formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
  }
  {
    name = "java";
    auto-format = true;
    formatter.command = "${pkgs.jdt-language-server}/bin/jdtls";
  }
  {
    name = "c";
    auto-format = true;
    formatter.command = "${pkgs.astyle}/bin/astyle --squeeze-ws --style=c";
  }
  # { }
  # { }
  # { }
]
