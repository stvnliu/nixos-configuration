{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "4e55b6a549b559e1d7d21b84e301e427d5b8d005";
    sha256 = "126fdmgw6d8iw0rx8jcwvjzri3jd7x6dbp5y8h11ri2csya6s5wp";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./where_is_my_sddm_theme_qt5/* $out/
  '';
}
