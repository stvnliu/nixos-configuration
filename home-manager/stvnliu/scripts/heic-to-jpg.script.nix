{pkgs}:
pkgs.writeShellScriptBin "heic-to-jpg" ''
  mkdir -p ./heic-to-jpg-out
  ${pkgs.findutils}/bin/find . -type f -print0 | ${pkgs.findutils}/bin/xargs -0 -I "{}" ${pkgs.imagemagick}/bin/magick "{}" -quality 100% ./jpg-out/"{}.conv.jpg"
''
