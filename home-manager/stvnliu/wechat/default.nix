{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  home.packages = with pkgs; [
    (wechat-uos.override {uosLicense = ./license.tar.gz;})
  ];
}
