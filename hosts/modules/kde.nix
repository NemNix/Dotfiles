{pkgs, ...}: {
  services.desktopManager.plasma6enable = true;
  services.desktopManager.plasma6.enableQt5Integration = false;
}
