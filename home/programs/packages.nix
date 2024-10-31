{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # DEV
    python3
    # MEDIA
    mpv
    imv
    pwvucontrol

    # CONNECTIONS
    overskride
    protonvpn-cli_2
    networkmanagerapplet

    # APPS
    floorp
    spotube
    vesktop
    nautilus
    keepassxc
    whatsapp-for-linux

    libreoffice
    qalculate-gtk

    # Utilities
    ventoy-full
    file-roller
  ];
}
