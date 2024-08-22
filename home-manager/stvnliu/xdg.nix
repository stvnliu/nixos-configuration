{pkgs, ...}: {
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.kde.okular.desktop";
        "image/png" = "sxiv.desktop";
        "image/jpeg" = "sxiv.desktop";
        "image/jpg" = "sxiv.desktop";
        "image/webp" = "sxiv.desktop";
        "image/heif" = "sxiv.desktop";
      };
    };
  };
}
