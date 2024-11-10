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
    inputs.zen-browser.packages."${system}".generic
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
