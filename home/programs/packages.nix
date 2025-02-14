{ pkgs, inputs, ... }:

with pkgs; let
  R = rWrapper.override { packages = with rPackages; [ ggplot2 dplyr xts languageserver httpgd ]; };
in

{
  home.packages = with pkgs; [

    # DEV
    R
    python313Packages.radian
    rstudio
    python3
    gcc
    ccache
    nix-tree

    # MEDIA
    mpv
    imv
    pwvucontrol

    # CONNECTIONS
    overskride
    protonvpn-cli_2
    networkmanagerapplet

    # APPS
    librewolf
    tor-browser
    ungoogled-chromium

    nautilus
    file-roller

    keepassxc

    zapzap
    netflix
    element-desktop

    ventoy-full
    qalculate-gtk
    gpu-screen-recorder-gtk

  ];
}
