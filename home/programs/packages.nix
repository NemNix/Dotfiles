{ pkgs, inputs, ... }:
{
  home.packages = [

    # DEV
    pkgs.gcc
    pkgs.ccache
    pkgs.python3
    pkgs.nix-tree
    inputs.nixpkgs-stable.legacyPackages.${"x86_64-linux"}.rstudio

    # MEDIA
    pkgs.mpv
    pkgs.imv
    pkgs.pwvucontrol

    # CONNECTIONS
    pkgs.overskride
    pkgs.protonvpn-cli_2
    pkgs.networkmanagerapplet

    # APPS
    pkgs.librewolf
    pkgs.tor-browser
    pkgs.ungoogled-chromium

    pkgs.nautilus
    pkgs.file-roller

    pkgs.keepassxc

    pkgs.zapzap
    pkgs.netflix
    pkgs.element-desktop

    pkgs.ventoy-full
    pkgs.qalculate-gtk
    pkgs.gnome-calendar
    pkgs.gpu-screen-recorder-gtk

  ];
}
