{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # DEV
    inputs.alejandra.defaultPackage.${system}
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

    libreoffice
    qalculate-gtk

    inputs.zen-browser.packages.${system}.specific

    # Utilities
    ventoy-full
    nautilus
    file-roller
  ];
}
