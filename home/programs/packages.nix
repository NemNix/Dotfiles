{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [

    # DEV
    python3
    gcc

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

    element-desktop
    whatsapp-for-linux

    qalculate-gtk

    gpu-screen-recorder-gtk

    ventoy-full
  ];
}
