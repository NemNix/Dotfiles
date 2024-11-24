{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # DEV
    python3
    python312Packages.ansicolors
    # MEDIA
    mpv
    imv
    pwvucontrol

    # CONNECTIONS
    overskride
    protonvpn-cli_2
    networkmanagerapplet

    # APPS
    notes
    floorp
    spotube
    vesktop
    nautilus
    chromium
    keepassxc
    whatsapp-for-linux

    libreoffice
    qalculate-gtk

    # Utilities
    ventoy-full
    file-roller
  ];
}
