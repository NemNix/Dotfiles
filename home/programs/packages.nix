{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [

    # DEV
    R
    # rstudio
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
