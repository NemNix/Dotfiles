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
    notes
    librewolf
    spotube
    nautilus
    keepassxc
    whatsapp-for-linux
    ungoogled-chromium

    qalculate-gtk

    # Utilities
    ventoy-full
    file-roller
  ];
}
