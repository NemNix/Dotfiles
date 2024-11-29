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
    keepassxc
    whatsapp-for-linux
    ungoogled-chromium

    libreoffice
    qalculate-gtk

    # Utilities
    ventoy-full
    file-roller
  ];
}
