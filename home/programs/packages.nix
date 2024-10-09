{pkgs, ...}: {
  home.packages = with pkgs; [
    # DEV
    inputs.alejandra.defaultPackage.${system}
    # MEDIA
    mpv # Video
    imv # Image
    ventoy-full

    # APPS
    protonvpn-cli_2
    spotube
    keepassxc

    vesktop
    gparted
    nautilus
    file-roller

    overskride
    pwvucontrol

    inputs.zen-browser.packages.${system}.generic
  ];
}
