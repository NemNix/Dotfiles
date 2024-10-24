{ pkgs
, ...
}:
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
    spotube
    vesktop
    keepassxc
    whatsapp-for-linux

    libreoffice
    qalculate-gtk

    floorp
    librewolf

    # Utilities
    ventoy-full
    nautilus
    file-roller
  ];
}
