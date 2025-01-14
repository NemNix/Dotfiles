{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [

    # DEV
    python3
    gcc
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

    whatsie
    element-desktop

    qalculate-gtk

    gpu-screen-recorder-gtk

    ventoy-full
  ];
}
