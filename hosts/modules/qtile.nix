# Enable Qtile
{ pkgs, ... }:
{
  # --------------------------------------
  # Enable QTILE
  # --------------------------------------
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = /home/nel/dotfiles/qtile/config.py;
    extraPackages = python3Packages: with python3Packages; [ qtile-extras ];
  };

  # --------------------------------------
  # Necessary things
  # --------------------------------------
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
